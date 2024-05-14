import 'package:webitel_portal_sdk/src/domain/entities/connect_status.dart';

class Connect {
  final ConnectStatus status;
  final String? errorMessage;

  Connect({
    required this.status,
    this.errorMessage,
  });
}
