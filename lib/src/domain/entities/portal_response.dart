import 'package:webitel_portal_sdk/src/domain/entities/portal_response_status.dart';

/// Represents a response from the portal, including status, message, and status code.
class PortalResponse {
  /// The status of the portal response.
  final PortalResponseStatus status;

  /// The message associated with the response, if any.
  final String? message;

  /// The status code of the response, if any.
  final String? statusCode;

  /// Constructs a [PortalResponse] instance with the given status, and optional status code and message.
  ///
  /// [status] The status of the portal response.
  /// [statusCode] The status code of the response (optional).
  /// [message] The message associated with the response (optional).
  PortalResponse({
    required this.status,
    this.statusCode,
    this.message,
  });
}
