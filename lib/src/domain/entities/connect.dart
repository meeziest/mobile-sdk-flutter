import 'package:webitel_portal_sdk/src/domain/entities/connect_status.dart';

/// Represents the connection status and any associated error message.
class Connect {
  /// The current status of the connection.
  final ConnectStatus status;

  /// The error message, if any, associated with the connection status.
  final String? errorMessage;

  /// Constructs a [Connect] instance with the given status and optional error message.
  ///
  /// [status] The current status of the connection.
  /// [errorMessage] The error message associated with the connection status (optional).
  Connect({
    required this.status,
    this.errorMessage,
  });
}
