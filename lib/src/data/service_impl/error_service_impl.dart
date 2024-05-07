import 'package:injectable/injectable.dart';
import 'package:webitel_portal_sdk/src/data/gateway/connect_listener_gateway.dart';
import 'package:webitel_portal_sdk/src/domain/entities/error.dart';
import 'package:webitel_portal_sdk/src/domain/services/error_service.dart';

@LazySingleton(as: ErrorService)
class ErrorServiceImpl implements ErrorService {
  final ConnectListenerGateway _connectListenerGateway;

  ErrorServiceImpl(this._connectListenerGateway);

  @override
  Stream<ErrorEntity> listenToErrors() {
    final errorStream = _connectListenerGateway.errorStream;
    return errorStream;
  }
}
