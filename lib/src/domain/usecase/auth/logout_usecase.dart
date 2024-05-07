import 'package:injectable/injectable.dart';
import 'package:webitel_portal_sdk/src/domain/entities/response_entity.dart';
import 'package:webitel_portal_sdk/src/domain/services/auth_service.dart';

abstract interface class LogoutUseCase {
  Future<ResponseEntity> call();
}

@LazySingleton(as: LogoutUseCase)
class LogoutImplUseCase implements LogoutUseCase {
  final AuthService _authService;

  LogoutImplUseCase(this._authService);

  @override
  Future<ResponseEntity> call() => _authService.logout();
}
