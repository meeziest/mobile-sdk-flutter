import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:webitel_portal_sdk/src/domain/entities/connect_status.dart';
import 'package:webitel_portal_sdk/src/domain/services/connect_status_listener_service.dart';

abstract interface class ListenConnectStatusUseCase {
  Future<StreamController<ConnectStreamStatus>> call();
}

@LazySingleton(as: ListenConnectStatusUseCase)
class ListenConnectStatusImplUseCase implements ListenConnectStatusUseCase {
  final ConnectStatusListenerService _connectStatusListenerService;

  ListenConnectStatusImplUseCase(this._connectStatusListenerService);

  @override
  Future<StreamController<ConnectStreamStatus>> call() =>
      _connectStatusListenerService.listenConnectStatus();
}
