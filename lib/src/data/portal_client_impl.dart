import 'package:injectable/injectable.dart';
import 'package:webitel_portal_sdk/src/domain/entities/call_error.dart';
import 'package:webitel_portal_sdk/src/domain/entities/channel.dart';
import 'package:webitel_portal_sdk/src/domain/entities/portal_client.dart';
import 'package:webitel_portal_sdk/src/domain/entities/portal_response.dart';
import 'package:webitel_portal_sdk/src/domain/entities/portal_user.dart';
import 'package:webitel_portal_sdk/src/domain/services/auth_service.dart';
import 'package:webitel_portal_sdk/src/domain/services/chat_service.dart';
import 'package:webitel_portal_sdk/src/injection/injection.dart';
import 'package:webitel_portal_sdk/src/managers/call.dart';
import 'package:webitel_portal_sdk/src/managers/chat.dart';

@LazySingleton(as: PortalClient)
final class PortalClientImpl implements PortalClient {
  final String url;
  final String appToken;
  @override
  final CallManager call;
  @override
  final CallError? error;
  @override
  final ChatManager chat;

  late final AuthService _authService;
  late final ChatService _chatService;

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

  @override
  Future<Channel> getChannel() async => _chatService.getChannel();

  @override
  Future<PortalResponse> logout() async => await _authService.logout();

  @override
  Future<PortalResponse> registerDevice({required String pushToken}) async =>
      await _authService.registerDevice(pushToken: pushToken);

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

  @override
  Future<PortalUser> getUser() async => _authService.getUser();
}
