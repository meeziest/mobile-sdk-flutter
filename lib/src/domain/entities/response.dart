import 'package:webitel_portal_sdk/src/domain/entities/response_status.dart';

class Response {
  final ResponseStatus status;
  final String? message;

  Response({
    required this.status,
    this.message,
  });
}
