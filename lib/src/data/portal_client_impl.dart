import 'package:injectable/injectable.dart';
import 'package:webitel_portal_sdk/src/domain/entities/channel.dart';
import 'package:webitel_portal_sdk/src/domain/entities/portal_client.dart';
import 'package:webitel_portal_sdk/src/domain/entities/response.dart';
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
  final ChatManager chat;

  late final AuthService _authService;
  late final ChatService _chatService;

  PortalClientImpl({
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
  Future<Response> logout() async => await _authService.logout();

  @override
  Future<Response> registerDevice({required String pushToken}) async =>
      await _authService.registerDevice(pushToken: pushToken);

  @override
  Future<Response> login({
    required String name,
    required String sub,
    required String issuer,
  }) async {
    return await _authService.login(
      name: name,
      sub: sub,
      issuer: issuer,
    );
  }
}
