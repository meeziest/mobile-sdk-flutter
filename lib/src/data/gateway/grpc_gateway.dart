import 'dart:async';

import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';
import 'package:webitel_portal_sdk/src/builder/call_options_builder.dart';
import 'package:webitel_portal_sdk/src/data/interceptor/interceptor.dart';
import 'package:webitel_portal_sdk/src/generated/portal/customer.pbgrpc.dart';
import 'package:webitel_portal_sdk/src/generated/portal/media.pbgrpc.dart';

@LazySingleton()
class GrpcGateway {
  late CustomerClient _customerStub;
  late MediaStorageClient _mediaStorageStub;
  late ClientChannel _channel;
  late String _accessToken = '';
  late String _baseUrl;
  late String _deviceId;
  late String _clientToken;
  late String _userAgent;
  final _streamControllerState = StreamController<ConnectionState>();

  Future<void> init({
    required String baseUrl,
    required String clientToken,
    required String deviceId,
    required String userAgent,
  }) async {
    _baseUrl = baseUrl;
    _deviceId = deviceId;
    _clientToken = clientToken;
    _userAgent = userAgent;
    await _createChannel(
      baseUrl: baseUrl,
      deviceId: deviceId,
      clientToken: clientToken,
      userAgent: _userAgent,
    );
  }

  Future<void> setAccessToken(String accessToken) async {
    _accessToken = accessToken;

    await _createChannel(
      baseUrl: _baseUrl,
      deviceId: _deviceId,
      clientToken: _clientToken,
      userAgent: _userAgent,
    );
  }

  CustomerClient get customerStub {
    return _customerStub;
  }

  MediaStorageClient get mediaStorageStub {
    return _mediaStorageStub;
  }

  ClientChannel get channel => _channel;

  StreamController<ConnectionState> get stateStream => _streamControllerState;

  Future<void> _createChannel({
    required String baseUrl,
    required String deviceId,
    required String clientToken,
    required String userAgent,
  }) async {
    final completer = Completer<void>();
    _channel = ClientChannel(
      baseUrl,
      port: 443,
      options: ChannelOptions(
        userAgent: userAgent,
        keepAlive: ClientKeepAliveOptions(
          pingInterval: Duration(seconds: 5),
          timeout: Duration(seconds: 3),
        ),
      ),
    );
    channel.onConnectionStateChanged.listen((state) {
      _streamControllerState.add(state);
    });

    _customerStub = CustomerClient(
      channel,
      interceptors: [GRPCInterceptor()],
      options: CallOptionsBuilder()
          .setDeviceId(deviceId)
          .setClientToken(clientToken)
          .setAccessToken(_accessToken)
          .build(),
    );
    _mediaStorageStub = MediaStorageClient(
      channel,
      interceptors: [GRPCInterceptor()],
      options: CallOptionsBuilder()
          .setDeviceId(deviceId)
          .setClientToken(clientToken)
          .setAccessToken(_accessToken)
          .build(),
    );
    completer.complete();
    await completer.future;
  }
}
