import 'package:webitel_portal_sdk/src/backbone/logger.dart';
import 'package:webitel_portal_sdk/src/communication/call_handler.dart';
import 'package:webitel_portal_sdk/src/communication/chat_handler.dart';
import 'package:webitel_portal_sdk/src/domain/entities/channel.dart';
import 'package:webitel_portal_sdk/src/domain/entities/response.dart';
import 'package:webitel_portal_sdk/src/domain/services/auth_service.dart';
import 'package:webitel_portal_sdk/src/injection/injection.dart';

class WebitelPortalSdk {
  late ChatHandler _chatHandler;
  late CallHandler _callHandler;
  late AuthService _authService;

  static WebitelPortalSdk? _instance;

  WebitelPortalSdk._internal() {
    _initDi();
    _callHandler = CallHandler();
    _chatHandler = ChatHandler();
  }

  static WebitelPortalSdk get instance {
    _instance ??= WebitelPortalSdk._internal();
    return _instance!;
  }

  Future<void> _initDi() async {
    configureDependencies();
    CustomLogger.initialize();

    _authService = getIt.get<AuthService>();
  }

  CallHandler get callHandler => _callHandler;

  ChatHandler get chatHandler => _chatHandler;

  Future<ResponseEntity> logout() async {
    return await _authService.logout();
  }

  Future<Channel> getChannel() async {
    return getIt.get<Channel>();
  }

  Future<ResponseEntity> registerDevice() async {
    return await _authService.registerDevice();
  }

  Future<ResponseEntity> login({
    required String url,
    required String appToken,
    required String appName,
    required String appVersion,
    required String platform,
    required String platformVersion,
    required String model,
    required String device,
    required String architecture,
    required String name,
    required String sub,
    required String issuer,
  }) async {
    return await _authService.login(
      url: url,
      appToken: appToken,
      appName: appName,
      appVersion: appVersion,
      platform: platform,
      platformVersion: platformVersion,
      model: model,
      device: device,
      architecture: architecture,
      name: name,
      sub: sub,
      issuer: issuer,
    );
  }
}
