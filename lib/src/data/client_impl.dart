import 'package:webitel_portal_sdk/src/communication/call_handler.dart';
import 'package:webitel_portal_sdk/src/communication/chat_handler.dart';
import 'package:webitel_portal_sdk/src/domain/entities/channel.dart';
import 'package:webitel_portal_sdk/src/domain/entities/client.dart';
import 'package:webitel_portal_sdk/src/domain/entities/response.dart';
import 'package:webitel_portal_sdk/src/domain/services/auth_service.dart';
import 'package:webitel_portal_sdk/src/injection/injection.dart';

class ClientImpl implements Client {
  final String url;
  final String appToken;
  @override
  final CallHandler callHandler;
  @override
  final ChatHandler chatHandler;

  late final AuthService _authService;

  ClientImpl({
    required this.url,
    required this.appToken,
    required this.callHandler,
    required this.chatHandler,
  }) {
    _authService = getIt.get<AuthService>();
  }

  @override
  Future<ResponseEntity> logout() async {
    return await _authService.logout();
  }

  @override
  Future<Channel> getChannel() async {
    return getIt.get<Channel>();
  }

  @override
  Future<ResponseEntity> registerDevice() async {
    return await _authService.registerDevice();
  }

  @override
  Future<ResponseEntity> login({
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
