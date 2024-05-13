import 'package:webitel_portal_sdk/src/domain/entities/client.dart';
import 'package:webitel_portal_sdk/src/domain/entities/response.dart';

abstract interface class AuthService {
  Future<ResponseEntity> logout();

  Future<ResponseEntity> registerDevice();

  Future<Client> initClient({required String url, required String appToken});

  Future<ResponseEntity> login({
    required String name,
    required String sub,
    required String issuer,
  });
}
