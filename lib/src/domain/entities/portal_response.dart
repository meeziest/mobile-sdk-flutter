import 'package:webitel_portal_sdk/src/domain/entities/portal_response_status.dart';

class PortalResponse {
  final PortalResponseStatus status;
  final String? message;

  PortalResponse({
    required this.status,
    this.message,
  });
}
