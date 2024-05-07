import 'package:webitel_portal_sdk/src/domain/entities/response_entity.dart';
import 'package:webitel_portal_sdk/src/domain/usecase/auth/login_usecase.dart';
import 'package:webitel_portal_sdk/src/domain/usecase/auth/logout_usecase.dart';
import 'package:webitel_portal_sdk/src/domain/usecase/auth/register_device_usecase.dart';
import 'package:webitel_portal_sdk/src/injection/injection.dart';

class AuthHandler {
  late RegisterDeviceUseCase _registerDeviceUseCase;
  late LogoutUseCase _logoutUseCase;
  late LoginUseCase _loginUseCase;

  AuthHandler() {
    _registerDeviceUseCase = getIt.get<RegisterDeviceUseCase>();
    _logoutUseCase = getIt.get<LogoutUseCase>();
    _loginUseCase = getIt.get<LoginUseCase>();
  }

  Future<ResponseEntity> logout() async {
    return await _logoutUseCase();
  }

  Future<ResponseEntity> registerDevice() async {
    return await _registerDeviceUseCase();
  }

  Future<ResponseEntity> login({
    required String baseUrl,
    required String clientToken,
    required String userAgent,
    required String appToken,
  }) async {
    return await _loginUseCase(
      appToken: appToken,
      baseUrl: baseUrl,
      clientToken: clientToken,
      userAgent: userAgent,
    );
  }
}
