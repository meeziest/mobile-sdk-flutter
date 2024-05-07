import 'dart:async';

import 'package:webitel_portal_sdk/src/domain/entities/connect_status.dart';
import 'package:webitel_portal_sdk/src/domain/usecase/connect_status_listener/listen_connect_status_usecase.dart';
import 'package:webitel_portal_sdk/src/domain/usecase/portal/exit_portal.dart';
import 'package:webitel_portal_sdk/src/injection/injection.dart';

class PortalHandler {
  late ExitPortalUseCase _exitPortalUsecase;
  late ListenConnectStatusUseCase _listenConnectStatusUseCase;

  PortalHandler() {
    _exitPortalUsecase = getIt.get<ExitPortalUseCase>();
    _listenConnectStatusUseCase = getIt.get<ListenConnectStatusUseCase>();
  }

  Future<void> exitPortal() async {
    await _exitPortalUsecase();
  }

  Future<StreamController<ConnectStreamStatus>> listenConnectStatus() async {
    final connectStreamStatusListener = await _listenConnectStatusUseCase();
    return connectStreamStatusListener;
  }
}
