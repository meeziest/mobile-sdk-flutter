import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:webitel_portal_sdk/src/domain/services/portal_service.dart';

abstract interface class ExitPortalUseCase {
  Future<void> call();
}

@LazySingleton(as: ExitPortalUseCase)
class ExitPortalImplUseCase implements ExitPortalUseCase {
  final PortalService _portalService;

  ExitPortalImplUseCase(this._portalService);

  @override
  Future<void> call() => _portalService.exitPortal();
}
