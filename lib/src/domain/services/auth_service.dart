import 'package:webitel_portal_sdk/src/domain/entities/response.dart';

abstract interface class AuthService {
  Future<ResponseEntity> logout();

  Future<ResponseEntity> registerDevice();

  Future<ResponseEntity> login({
    required String url,
    required String appToken,
    required String appName,
    required String appVersion,
    required String platform,
    required String platformVersion,
    required String model,
    required String device,
    required String architecture,
    required String name,
    required String sub,
    required String issuer,
  });
}
