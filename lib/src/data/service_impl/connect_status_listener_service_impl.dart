import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:webitel_portal_sdk/src/data/gateway/connect_listener_gateway.dart';
import 'package:webitel_portal_sdk/src/domain/entities/connect_status.dart';
import 'package:webitel_portal_sdk/src/domain/services/connect_status_listener_service.dart';

@LazySingleton(as: ConnectStatusListenerService)
class ConnectStatusListenerServiceImpl implements ConnectStatusListenerService {
  final ConnectListenerGateway _connectListenerGateway;

  ConnectStatusListenerServiceImpl(this._connectListenerGateway);

  @override
  Future<StreamController<ConnectStreamStatus>> listenConnectStatus() async {
    return _connectListenerGateway.connectStatusStream;
  }
}
