import 'dart:async';

import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';
import 'package:synchronized/synchronized.dart';
import 'package:webitel_portal_sdk/src/backbone/channel_status_helper.dart';
import 'package:webitel_portal_sdk/src/backbone/logger.dart';
import 'package:webitel_portal_sdk/src/backbone/response_type_helper.dart';
import 'package:webitel_portal_sdk/src/data/grpc/grpc_channel.dart';
import 'package:webitel_portal_sdk/src/database/database.dart';
import 'package:webitel_portal_sdk/src/domain/entities/channel_status.dart';
import 'package:webitel_portal_sdk/src/domain/entities/connect.dart';
import 'package:webitel_portal_sdk/src/domain/entities/connect_status.dart';
import 'package:webitel_portal_sdk/src/domain/entities/error.dart';
import 'package:webitel_portal_sdk/src/domain/entities/response_type.dart';
import 'package:webitel_portal_sdk/src/generated/google/protobuf/any.pb.dart';
import 'package:webitel_portal_sdk/src/generated/portal/connect.pb.dart'
    as portal;
import 'package:webitel_portal_sdk/src/generated/portal/messages.pb.dart';

@LazySingleton()
class GrpcConnect {
  final GrpcChannel _grpcChannel;
  final DatabaseProvider _databaseProvider;

  final StreamController<portal.Response> _responseStreamController =
      StreamController<portal.Response>.broadcast();
  final StreamController<ConnectEntity> _connectController =
      StreamController<ConnectEntity>.broadcast();
  final StreamController<UpdateNewMessage> _updateStreamController =
      StreamController<UpdateNewMessage>.broadcast();
  final StreamController<portal.Request> _requestStreamController =
      StreamController<portal.Request>.broadcast();
  final StreamController<ErrorEntity> _errorStreamController =
      StreamController<ErrorEntity>.broadcast();
  Stream<portal.Update>? _responseStream;
  final StreamController<ChannelStatus> _channelStatus =
      StreamController<ChannelStatus>.broadcast();

  bool connectClosed = true;
  final Lock _lock = Lock();
  final log = CustomLogger.getLogger('ConnectListenerGateway');
  ConnectionState? _connectionState;
  Timer? _timer;

  GrpcConnect(this._databaseProvider, this._grpcChannel) {
    listenToChannelStatus();
  }

  Future<void> listenToResponses() async {
    try {
      if (_responseStream != null) {
        await for (portal.Update update in _responseStream!) {
          connectClosed = false;
          _connectController.add(ConnectEntity(status: ConnectStatus.opened));
          final responseType = ResponseTypeHelper.determineResponseType(update);
          log.info('Response type: $responseType');

          switch (responseType) {
            case ResponseType.response:
              _responseStreamController.add(
                update.data.unpackInto(
                  portal.Response(),
                ),
              );
              break;

            case ResponseType.updateNewMessage:
              final decodedUpdate = update.data.unpackInto(
                UpdateNewMessage(),
              );
              _updateStreamController.add(decodedUpdate);
              log.info(decodedUpdate.message.text);
              break;

            case ResponseType.error:
              final decodedResponse = update.data.unpackInto(
                portal.Response(),
              );
              _errorStreamController.add(
                ErrorEntity(
                  statusCode: decodedResponse.err.code.toString(),
                  errorMessage: decodedResponse.err.message,
                ),
              );
              break;
          }
        }
      } else {
        log.warning('_response stream is null');
      }
    } on GrpcError catch (err, stack) {
      log.warning('GRPC Error: $err', err, stack);
      _errorStreamController.add(ErrorEntity.fromGrpcError(err));
      handleConnectionClosure(err.toString());
    } catch (err, stack) {
      log.warning('Unexpected error: $err', err, stack);
      handleConnectionClosure(err.toString());
    }
  }

  void handleConnectionClosure(String errorMessage) {
    connectClosed = true;
    _responseStream = null;
    _connectController.add(ConnectEntity(
      status: ConnectStatus.closed,
      errorMessage: errorMessage,
    ));
  }

  Future<void> _connect() async {
    try {
      _responseStream = _grpcChannel.customerStub
          .connect(_requestStreamController.stream)
          .asBroadcastStream();

      await _responseStream?.isEmpty;
      listenToResponses();
    } catch (err) {
      connectClosed = true;
      _responseStream = null;
      log.info(err);
    }
  }

  Future<void> sendPingMessage() async {
    final String echoDataString = 'Bind';
    final List<int> echoDataBytes = echoDataString.codeUnits;
    final echo = portal.Echo(data: echoDataBytes);
    final request = portal.Request(
      path: '/webitel.portal.Customer/Ping',
      data: Any.pack(echo),
    );
    _requestStreamController.add(request);
    log.info('Request added: ${request.path}');
  }

  Future<void> sendRequest(portal.Request request) async {
    log.info('Staring sending request...');
    if (connectClosed == true && _responseStream == null) {
      log.warning(
          'Connection state is not ready or connection is closed. Attempting to reconnect...');
      await reconnect();
    }
    _requestStreamController.add(request);
    log.info('Request added: ${request.path}');
  }

  Future<void> reconnect() async {
    if (_connectionState == ConnectionState.shutdown) {
      log.info('Current connection state: $_connectionState');
      final user = await _databaseProvider.readUser();
      await _grpcChannel.setAccessToken(user.accessToken);
      log.info('Re-init gRPC Channel');
    }
    await _lock.synchronized(() async {
      _timer = Timer.periodic(Duration(seconds: 1), (timer) async {
        sendPingMessage();
      });
      await _connect();
      _timer?.cancel();
      log.info('Connected to gRPC Stream');
    });
  }

  Future<void> listenToChannelStatus() async {
    _grpcChannel.stateStream.stream.listen((state) async {
      _channelStatus.add(
        ChannelStatusHelper.toChannelStatus(
          state.name,
        ),
      );
      if (state == ConnectionState.shutdown) {
        handleStreamCleanup();
        _connectController.add(
          ConnectEntity(
            errorMessage:
                'Connect was closed duu to the channel state change: $state',
            status: ConnectStatus.opened,
          ),
        );
        log.warning('Response stream canceled due to $state');
      } else if (state == ConnectionState.transientFailure) {
        _connectController.add(
          ConnectEntity(
            errorMessage:
                'Connect was closed duu to the channel state change: $state',
            status: ConnectStatus.opened,
          ),
        );
        handleStreamCleanup();
        log.warning('Response stream canceled due to $state');
      }
      _connectionState = state;
    });
  }

  void handleStreamCleanup() {
    _responseStream = null;
    connectClosed = true;
  }

  Stream<portal.Response> get responseStream =>
      _responseStreamController.stream;

  Stream<UpdateNewMessage> get updateStream => _updateStreamController.stream;

  StreamController<ErrorEntity> get errorStream => _errorStreamController;

  StreamController<ConnectEntity> get connectStatusStream => _connectController;

  StreamController<ChannelStatus> get chanelStatusStream => _channelStatus;

  void dispose() {
    _requestStreamController.close();
    _responseStreamController.close();
    _connectController.close();
    _updateStreamController.close();
    _channelStatus.close();
  }
}
