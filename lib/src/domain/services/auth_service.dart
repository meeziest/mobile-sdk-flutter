import 'package:webitel_portal_sdk/src/domain/entities/response_entity.dart';

abstract interface class AuthService {
  Future<ResponseEntity> logout();

  Future<ResponseEntity> registerDevice();

  Future<ResponseEntity> login({
    required String baseUrl,
    required String userAgent,
    required String clientToken,
    required String appToken,
  });
}
