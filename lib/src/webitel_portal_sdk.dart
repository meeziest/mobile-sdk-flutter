import 'package:webitel_portal_sdk/src/backbone/logger.dart';
import 'package:webitel_portal_sdk/src/domain/entities/portal_client.dart';
import 'package:webitel_portal_sdk/src/domain/services/auth_service.dart';
import 'package:webitel_portal_sdk/src/injection/injection.dart';

class WebitelPortalSdk {
  static WebitelPortalSdk? _instance;

  WebitelPortalSdk._internal();

  static WebitelPortalSdk get instance {
    _instance ??= WebitelPortalSdk._internal();
    return _instance!;
  }

  Future<PortalClient> initClient({
    required String url,
    required String appToken,
  }) async {
    configureDependencies();
    CustomLogger.initialize();
    AuthService authService = getIt<AuthService>();

    final client = authService.initClient(url: url, appToken: appToken);
    return client;
  }
}
