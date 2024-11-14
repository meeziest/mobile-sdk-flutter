import 'package:injectable/injectable.dart';
import 'package:webitel_portal_sdk/src/domain/entities/call_error.dart';
import 'package:webitel_portal_sdk/src/domain/entities/channel.dart';
import 'package:webitel_portal_sdk/src/domain/entities/portal_client.dart';
import 'package:webitel_portal_sdk/src/domain/entities/portal_response.dart';
import 'package:webitel_portal_sdk/src/domain/entities/portal_user.dart';
import 'package:webitel_portal_sdk/src/domain/services/auth_service.dart';
import 'package:webitel_portal_sdk/src/domain/services/chat_service.dart';
import 'package:webitel_portal_sdk/src/injection/injection.dart';

import 'managers/call.dart';
import 'managers/chat.dart';

/// Implementation of [PortalClient] that provides functionalities for portal client operations.
@LazySingleton(as: PortalClient)
final class PortalClientImpl implements PortalClient {
  /// The URL of the portal.
  final String url;

  /// The application token for authentication.
  final String appToken;

  /// The manager for handling call operations.
  @override
  final CallManager call;

  /// The error associated with the portal client, if any.
  @override
  final CallError? error;

  /// The manager for handling chat operations.
  @override
  final ChatManager chat;

  // Dependencies on the AuthService and ChatService to handle authentication and chat-related operations.
  late final AuthService _authService;
  late final ChatService _chatService;

  /// Constructor for initializing a [PortalClientImpl] instance.
  ///
  /// [url] The URL of the portal.
  /// [appToken] The application token for authentication.
  /// [call] The manager for handling call operations.
  /// [chat] The manager for handling chat operations.
  /// [error] The error associated with the portal client, if any.
  PortalClientImpl({
    this.error,
    required this.url,
    required this.appToken,
    required this.call,
    required this.chat,
  }) {
    _authService = getIt.get<AuthService>();
    _chatService = getIt.get<ChatService>();
  }

  /// Retrieves the current communication channel.
  ///
  /// Returns a [Future] that completes with a [Channel].
  @override
  Future<Channel> getChannel() async => _chatService.getChannel();

  /// Logs out the current user.
  ///
  /// Returns a [Future] that completes with a [PortalResponse] indicating the result of the logout operation.
  @override
  Future<PortalResponse> logout() async => await _authService.logout();

  /// Registers a device with the given push token.
  ///
  /// [pushToken] The push token for the device.
  ///
  /// Returns a [Future] that completes with a [PortalResponse] indicating the result of the registration operation.
  @override
  Future<PortalResponse> registerDevice({required String pushToken}) async =>
      await _authService.registerDevice(pushToken: pushToken);

  /// Unregisters a device from push notifications..
  ///
  /// Returns a [Future] that completes with a [PortalResponse] indicating
  /// the result of the un-registration operation.
  @override
  Future<PortalResponse> unregisterDevice() async =>
      _authService.unregisterDevice();

  /// Logs in a user with the provided credentials.
  ///
  /// [name] The name of the user.
  /// [sub] The subject identifier.
  /// [issuer] The issuer of the credentials.
  /// [locale] The locale of the user (optional).
  /// [email] The email of the user (optional).
  /// [emailVerified] Whether the email is verified (optional).
  /// [phoneNumber] The phone number of the user (optional).
  /// [phoneNumberVerified] Whether the phone number is verified (optional).
  ///
  /// Returns a [Future] that completes with a [PortalResponse] indicating the result of the login operation.
  @override
  Future<PortalResponse> login({
    required String name,
    required String sub,
    required String issuer,
    String? locale,
    String? email,
    bool? emailVerified,
    String? phoneNumber,
    bool? phoneNumberVerified,
  }) async {
    return await _authService.login(
      name: name,
      sub: sub,
      issuer: issuer,
      locale: locale ?? '',
      email: email ?? '',
      emailVerified: emailVerified ?? false,
      phoneNumber: phoneNumber ?? '',
      phoneNumberVerified: phoneNumberVerified ?? false,
    );
  }

  /// Retrieves the current user information.
  ///
  /// Returns a [Future] that completes with a [PortalUser].
  @override
  Future<PortalUser> getUser() async => _authService.getUser();

  /// Sends a ping request to the server to check the connection status.
  ///
  /// This method creates an Echo request with the data 'Client ping' and sends it to the
  /// server using the gRPC channel. It converts the server's response to a string and returns it.
  /// If a gRPC error occurs, it logs the error and returns an error message.
  ///
  /// Returns a [Future<String>] that completes with the server's response as a string,
  /// or an error message if the ping request fails.
  @override
  Future<String> ping() async => _chatService.ping();
}
