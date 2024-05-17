import 'package:grpc/grpc.dart';

class CallError {
  final String statusCode;
  final String errorMessage;

  // Constructor to create an error entity manually
  CallError({
    required this.statusCode,
    required this.errorMessage,
  });

  // Factory method to create an error entity from a GrpcError
  static CallError fromGrpcError(GrpcError error) {
    String message;
    switch (error.code) {
      case StatusCode.cancelled:
        message = "The request was cancelled.";
        break;
      case StatusCode.unknown:
        message = "An unknown error occurred.";
        break;
      case StatusCode.invalidArgument:
        message = "Invalid arguments were provided.";
        break;
      case StatusCode.deadlineExceeded:
        message = "The request deadline was exceeded.";
        break;
      case StatusCode.notFound:
        message = "The requested resource was not found.";
        break;
      case StatusCode.alreadyExists:
        message = "The resource already exists.";
        break;
      case StatusCode.permissionDenied:
        message = "Permission was denied.";
        break;
      case StatusCode.resourceExhausted:
        message = "Resource limits were exhausted.";
        break;
      case StatusCode.failedPrecondition:
        message = "Operation failed due to a precondition.";
        break;
      case StatusCode.aborted:
        message = "The operation was aborted.";
        break;
      case StatusCode.outOfRange:
        message = "The operation was out of range.";
        break;
      case StatusCode.unimplemented:
        message = "The operation is not implemented.";
        break;
      case StatusCode.internal:
        message = "An internal error occurred.";
        break;
      case StatusCode.unavailable:
        message = "The service is currently unavailable.";
        break;
      case StatusCode.dataLoss:
        message = "Data loss was detected.";
        break;
      case StatusCode.unauthenticated:
        message = "The request requires authentication.";
        break;
      default:
        message = "An unexpected error occurred.";
        break;
    }
    return CallError(
      statusCode: error.codeName,
      errorMessage: message,
    );
  }

  // Static method to create a generic timeout error
  static CallError createTimeoutError() {
    return CallError(
      statusCode: 'Timeout',
      errorMessage: "The operation timed out.",
    );
  }
}
