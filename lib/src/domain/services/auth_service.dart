import 'package:webitel_portal_sdk/src/domain/entities/portal_client.dart';
import 'package:webitel_portal_sdk/src/domain/entities/portal_response.dart';
import 'package:webitel_portal_sdk/src/domain/entities/user.dart';

abstract interface class AuthService {
  Future<PortalResponse> logout();

  Future<PortalResponse> registerDevice({required String pushToken});

  Future<PortalClient> initClient({
    required String url,
    required String appToken,
  });

  Future<PortalResponse> login({
    required String name,
    required String sub,
    required String issuer,
    String locale,
    String email,
    bool emailVerified,
    String phoneNumber,
    bool phoneNumberVerified,
  });

  Future<User> getUser();
}
