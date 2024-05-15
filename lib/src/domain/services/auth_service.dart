import 'package:webitel_portal_sdk/src/domain/entities/client.dart';
import 'package:webitel_portal_sdk/src/domain/entities/response.dart';

abstract interface class AuthService {
  Future<Response> logout();

  Future<Response> registerDevice({required String pushToken});

  Future<Client> initClient({required String url, required String appToken});

  Future<Response> login({
    required String name,
    required String sub,
    required String issuer,
    String locale,
    String email,
    bool emailVerified,
    String phoneNumber,
    bool phoneNumberVerified,
  });
}
