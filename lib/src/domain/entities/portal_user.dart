import 'package:webitel_portal_sdk/src/domain/entities/call_error.dart';

/// Represents a user in the portal, including user details and potential error information.
class PortalUser {
  /// The error associated with the user, if any.
  final CallError? error;

  /// The unique identifier of the user.
  final String id;

  /// The name of the user.
  final String name;

  /// The subject (user ID) of the user.
  final String sub;

  /// The issuer of the user's credentials.
  final String issuer;

  /// The expiration time of the user's token.
  final int tokenExpiration;

  /// The locale of the user, if any.
  final String? locale;

  /// The email of the user, if any.
  final String? email;

  /// Indicates if the user's email is verified, if any.
  final bool? emailVerified;

  /// The phone number of the user, if any.
  final String? phoneNumber;

  /// Indicates if the user's phone number is verified, if any.
  final bool? phoneNumberVerified;

  /// Constructs a [PortalUser] instance with the given user details and optional error information.
  ///
  /// [issuer] The issuer of the user's credentials.
  /// [name] The name of the user.
  /// [sub] The subject (user ID) of the user.
  /// [tokenExpiration] The expiration time of the user's token.
  /// [id] The unique identifier of the user.
  /// [error] The error associated with the user (optional).
  /// [locale] The locale of the user (optional).
  /// [email] The email of the user (optional).
  /// [emailVerified] Indicates if the user's email is verified (optional).
  /// [phoneNumber] The phone number of the user (optional).
  /// [phoneNumberVerified] Indicates if the user's phone number is verified (optional).
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

  /// Named constructor for creating an initial/default instance of [PortalUser].
  ///
  /// The initial instance has default values for all fields.
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

  /// Named constructor for creating an error instance of [PortalUser].
  ///
  /// This instance contains only error information, with default values for all other fields.
  ///
  /// [error] The error associated with the user.
  PortalUser.error({required this.error})
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
