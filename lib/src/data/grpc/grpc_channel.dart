import 'dart:async';

import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';
import 'package:webitel_portal_sdk/src/builder/call_options_builder.dart';
import 'package:webitel_portal_sdk/src/data/interceptor/interceptor.dart';
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

  CustomerClient get customerStub {
    return _customerStub;
  }

  MediaStorageClient get mediaStorageStub {
    return _mediaStorageStub;
  }

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
    final completer = Completer<void>();
    _channel = ClientChannel(
      url,
      port: port,
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
          .setClientToken(appToken)
          .setAccessToken(_accessToken)
          .build(),
    );
    _mediaStorageStub = MediaStorageClient(
      channel,
      interceptors: [GRPCInterceptor()],
      options: CallOptionsBuilder()
          .setDeviceId(deviceId)
          .setClientToken(appToken)
          .setAccessToken(_accessToken)
          .build(),
    );
    completer.complete();
    await completer.future;
  }
}
