import 'package:injectable/injectable.dart';
import 'package:webitel_portal_sdk/src/communication/call_handler.dart';
import 'package:webitel_portal_sdk/src/communication/chat_handler.dart';
import 'package:webitel_portal_sdk/src/domain/entities/channel.dart';
import 'package:webitel_portal_sdk/src/domain/entities/client.dart';
import 'package:webitel_portal_sdk/src/domain/entities/response.dart';
import 'package:webitel_portal_sdk/src/domain/services/auth_service.dart';
import 'package:webitel_portal_sdk/src/domain/services/chat_service.dart';
import 'package:webitel_portal_sdk/src/injection/injection.dart';

@LazySingleton(as: Client)
final class ClientImpl implements Client {
  final String url;
  final String appToken;
  @override
  final CallHandler callHandler;
  @override
  final ChatHandler chatHandler;

  late final AuthService _authService;
  late final ChatService _chatService;

  ClientImpl({
    required this.url,
    required this.appToken,
    required this.callHandler,
    required this.chatHandler,
  }) {
    _authService = getIt.get<AuthService>();
    _chatService = getIt.get<ChatService>();
  }

  @override
  Future<Channel> getChannel() async => _chatService.getChannel();

  @override
  Future<Response> logout() async => await _authService.logout();

  @override
  Future<Response> registerDevice() async =>
      await _authService.registerDevice();

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
