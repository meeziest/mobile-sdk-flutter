import 'package:webitel_portal_sdk/src/domain/entities/connect.dart';
import 'package:webitel_portal_sdk/src/domain/entities/connect_status.dart';

final class ConnectStreamStatusBuilder {
  late ConnectStatus _status;
  String? _errorMessage;

  ConnectStreamStatusBuilder setStatus(ConnectStatus status) {
    _status = status;
    return this;
  }

  ConnectStreamStatusBuilder setErrorMessage(String? errorMessage) {
    _errorMessage = errorMessage;
    return this;
  }

  Connect build() {
    return Connect(
      status: _status,
      errorMessage: _errorMessage,
    );
  }
}
