import 'package:webitel_portal_sdk/src/domain/entities/response_status.dart';

class ResponseEntity {
  final ResponseStatus status;
  final String? message;

  ResponseEntity({required this.status, this.message});
}
