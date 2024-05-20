import 'package:webitel_portal_sdk/src/domain/entities/media_file/media_file_request.dart';

class DialogMessageRequest {
  final MediaFileRequest file;
  final String content;
  final String requestId;
  final String? chatId;
  final String? messageId;

  DialogMessageRequest({
    required this.requestId,
    required this.content,
    required this.file,
    this.chatId,
    this.messageId,
  });
}
