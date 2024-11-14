import 'package:webitel_portal_sdk/src/data/managers/call.dart';
import 'package:webitel_portal_sdk/src/data/managers/chat.dart';
import 'package:webitel_portal_sdk/src/domain/entities/call_error.dart';
import 'package:webitel_portal_sdk/src/domain/entities/channel.dart';
import 'package:webitel_portal_sdk/src/domain/entities/portal_response.dart';
import 'package:webitel_portal_sdk/src/domain/entities/portal_user.dart';

/// Interface for the portal client, providing methods for authentication,
/// device registration, user information retrieval, and access to chat and call managers.
abstract interface class PortalClient {
  /// Logs out the current user.
  ///
  /// Returns a [PortalResponse] indicating the result of the logout operation.
  Future<PortalResponse> logout();

  /// Retrieves the current communication channel.
  ///
  /// Returns a [Channel] representing the current communication channel.
  Future<Channel> getChannel();

  /// Registers a device with a given push token.
  ///
  /// [pushToken] The push token to register the device with.
  ///
  /// Returns a [PortalResponse] indicating the result of the registration.
  Future<PortalResponse> registerDevice({required String pushToken});

  /// Unregisters a device from push notifications..
  ///
  /// Returns a [PortalResponse] indicating the result of the un-registration.
  Future<PortalResponse> unregisterDevice();

  /// Logs in a user with the provided credentials and user information.
  ///
  /// [name] The name of the user.
  /// [sub] The subject (user ID).
  /// [issuer] The issuer of the credentials.
  /// [locale] The locale of the user (optional).
  /// [email] The email of the user (optional).
  /// [emailVerified] Indicates if the email is verified (optional).
  /// [phoneNumber] The phone number of the user (optional).
  /// [phoneNumberVerified] Indicates if the phone number is verified (optional).
  ///
  /// Returns a [PortalResponse] indicating the result of the login operation.
  Future<PortalResponse> login({
    required String name,
    required String sub,
    required String issuer,
    String? locale,
    String? email,
    bool? emailVerified,
    String? phoneNumber,
    bool? phoneNumberVerified,
  });

  /// Retrieves the current user information.
  ///
  /// Returns a [PortalUser] representing the current user.
  Future<PortalUser> getUser();

  /// Sends a ping request to the server to check the connection status.
  ///
  /// This method creates an Echo request with the data 'Client ping' and sends it to the
  /// server using the gRPC channel. It converts the server's response to a string and returns it.
  /// If a gRPC error occurs, it logs the error and returns an error message.
  ///
  /// Returns a [Future<String>] that completes with the server's response as a string,
  /// or an error message if the ping request fails.
  Future<String> ping();

  /// Retrieves the last occurred error, if any.
  ///
  /// Returns a [CallError] if an error occurred, otherwise returns null.
  CallError? get error;

  /// Provides access to the chat manager.
  ///
  /// Returns a [ChatManager] instance to manage chat operations.
  ChatManager get chat;

  /// Provides access to the call manager.
  ///
  /// Returns a [CallManager] instance to manage call operations.
  CallManager get call;
}
