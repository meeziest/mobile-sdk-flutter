import 'package:injectable/injectable.dart';
import 'package:webitel_portal_sdk/src/domain/entities/response_entity.dart';
import 'package:webitel_portal_sdk/src/domain/services/auth_service.dart';

abstract interface class RegisterDeviceUseCase {
  Future<ResponseEntity> call();
}

@LazySingleton(as: RegisterDeviceUseCase)
class RegisterDeviceImplUseCase implements RegisterDeviceUseCase {
  final AuthService _authService;

  RegisterDeviceImplUseCase(this._authService);

  @override
  Future<ResponseEntity> call() => _authService.registerDevice();
}
