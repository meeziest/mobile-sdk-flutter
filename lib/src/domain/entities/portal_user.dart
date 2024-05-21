import 'package:webitel_portal_sdk/src/domain/entities/call_error.dart';

class PortalUser {
  final CallError? error;
  final String id;
  final String name;
  final String sub;
  final String issuer;
  final int tokenExpiration;
  final String? locale;
  final String? email;
  final bool? emailVerified;
  final String? phoneNumber;
  final bool? phoneNumberVerified;

  PortalUser({
    required this.issuer,
    required this.name,
    required this.sub,
    required this.tokenExpiration,
    required this.id,
    this.error,
    this.locale,
    this.phoneNumber,
    this.phoneNumberVerified,
    this.email,
    this.emailVerified,
  });

  PortalUser.initial()
      : name = '',
        sub = '',
        issuer = '',
        tokenExpiration = 0,
        id = '',
        locale = '',
        email = '',
        emailVerified = false,
        phoneNumber = '',
        phoneNumberVerified = false,
        error = null;

  PortalUser.error({required CallError this.error})
      : name = '',
        sub = '',
        issuer = '',
        tokenExpiration = 0,
        id = '',
        locale = '',
        email = '',
        emailVerified = false,
        phoneNumber = '',
        phoneNumberVerified = false;
}
