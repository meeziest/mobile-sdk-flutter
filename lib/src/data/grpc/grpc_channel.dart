import 'dart:async';

import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:webitel_portal_sdk/src/backbone/backoff.dart';
import 'package:webitel_portal_sdk/src/backbone/builder/call_options_builder.dart';
import 'package:webitel_portal_sdk/src/generated/portal/customer.pbgrpc.dart';
import 'package:webitel_portal_sdk/src/generated/portal/media.pbgrpc.dart';

@LazySingleton()
class GrpcChannel {
  late CustomerClient _customerStub;
  late MediaStorageClient _mediaStorageStub;
  late ClientChannel _channel;
  late String _accessToken = '';
  late String _url;
  late int _port;
  late bool _secure;
  late String _deviceId;
  late String _appToken;
  late String _userAgent;
  final _streamControllerState = StreamController<ConnectionState>();
  final Logger _logger = Logger('GrpcChannel');
  final Backoff _backoff = Backoff(maxAttempts: 10);

  Future<void> init({
    required String url,
    required String appToken,
    required String deviceId,
    required String userAgent,
    required int port,
    required bool secure,
  }) async {
    _url = url;
    _secure = secure;
    _port = port;
    _deviceId = deviceId;
    _appToken = appToken;
    _userAgent = userAgent;
    await _createChannel(
      url: url,
      deviceId: deviceId,
      appToken: appToken,
      userAgent: _userAgent,
      port: port,
      secure: secure,
    );
  }

  Future<void> setAccessToken(String accessToken) async {
    _accessToken = accessToken;

    await _createChannel(
      url: _url,
      port: _port,
      secure: _secure,
      deviceId: _deviceId,
      appToken: _appToken,
      userAgent: _userAgent,
    );
  }

  CustomerClient get customerStub => _customerStub;

  MediaStorageClient get mediaStorageStub => _mediaStorageStub;

  ClientChannel get channel => _channel;

  StreamController<ConnectionState> get stateStream => _streamControllerState;

  Future<void> _createChannel({
    required String deviceId,
    required String appToken,
    required String userAgent,
    required int port,
    required String url,
    required bool secure,
  }) async {
    _channel = ClientChannel(
      url,
      port: port,
      options: ChannelOptions(
        credentials: secure
            ? ChannelCredentials.secure()
            : ChannelCredentials.insecure(),
        userAgent: userAgent,
        idleTimeout: Duration(minutes: 5),
        connectionTimeout: Duration(minutes: 50),
        backoffStrategy: defaultBackoffStrategy,
        keepAlive: ClientKeepAliveOptions(
          pingInterval: Duration(seconds: 3),
          timeout: Duration(seconds: 2),
        ),
      ),
    );

    _channel.onConnectionStateChanged.listen((state) {
      _logger.info('Connection state changed: $state');
      _streamControllerState.add(state);

      if (state == ConnectionState.shutdown) {
        _logger.warning(
            'Connection has been shutdown. Attempting to reconnect...');
        _reconnect();
      }
    });

    _customerStub = CustomerClient(
      _channel,
      options: CallOptionsBuilder()
          .setDeviceId(deviceId)
          .setClientToken(appToken)
          .setAccessToken(_accessToken)
          .build(),
    );
    _mediaStorageStub = MediaStorageClient(
      _channel,
      options: CallOptionsBuilder()
          .setDeviceId(deviceId)
          .setClientToken(appToken)
          .setAccessToken(_accessToken)
          .build(),
    );
  }

  Future<void> _reconnect() async {
    _backoff.reset();

    while (_backoff.shouldRetry()) {
      try {
        await _createChannel(
          url: _url,
          port: _port,
          secure: _secure,
          deviceId: _deviceId,
          appToken: _appToken,
          userAgent: _userAgent,
        );
        _logger.info('Reconnection successful');
        return;
      } on GrpcError catch (err) {
        _backoff.increment();
        _logger.warning('Reconnection attempt ${_backoff.attempt} failed', err);
        final backoffDuration = _backoff.nextDelay();
        _logger.info('Retrying in ${backoffDuration.inSeconds} seconds...');
        await Future.delayed(backoffDuration);
      }
    }
    _logger.severe('Max reconnection attempts reached.');
  }
}
