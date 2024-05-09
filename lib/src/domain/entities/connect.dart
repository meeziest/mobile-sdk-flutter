import 'package:webitel_portal_sdk/src/domain/entities/connect_status.dart';

class ConnectEntity {
  final ConnectStatus status;
  final String? errorMessage;

  ConnectEntity({
    required this.status,
    this.errorMessage,
  });
}
