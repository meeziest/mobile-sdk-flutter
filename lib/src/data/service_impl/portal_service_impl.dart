import 'package:injectable/injectable.dart';
import 'package:webitel_portal_sdk/src/data/gateway/connect_listener_gateway.dart';
import 'package:webitel_portal_sdk/src/domain/services/portal_service.dart';

@LazySingleton(as: PortalService)
class PortalServiceImpl implements PortalService {
  final ConnectListenerGateway _connectListenerGateway;

  PortalServiceImpl(this._connectListenerGateway);

  @override
  Future<void> exitPortal() async {
    _connectListenerGateway.dispose();
  }
}
