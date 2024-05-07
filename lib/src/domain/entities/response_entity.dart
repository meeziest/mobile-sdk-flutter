enum ResponseStatus { initial, success, error }

class ResponseEntity {
  final ResponseStatus status;
  final String? message;

  ResponseEntity({required this.status, this.message});
}
