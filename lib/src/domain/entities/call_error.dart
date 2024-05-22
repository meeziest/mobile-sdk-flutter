/// Represents an error that occurs during a call operation.
class CallError {
  /// The status code of the error, if available.
  final String? statusCode;

  /// The error message describing the error.
  final String errorMessage;

  /// Constructs a [CallError] instance with the given status code and error message.
  ///
  /// [statusCode] The status code of the error (optional).
  /// [errorMessage] The error message describing the error.
  CallError({
    this.statusCode,
    required this.errorMessage,
  });
}
