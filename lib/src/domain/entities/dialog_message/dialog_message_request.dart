import 'package:webitel_portal_sdk/src/domain/entities/media_file/media_file_request.dart';
import 'package:webitel_portal_sdk/src/domain/entities/message_type.dart';

class DialogMessageRequest {
  final MessageType messageType;
  final MediaFileRequest file;
  final String dialogMessageContent;
  final String requestId;
  final String? chatId;
  final String? messageId;

  DialogMessageRequest({
    required this.messageType,
    required this.requestId,
    required this.dialogMessageContent,
    required this.file,
    this.chatId,
    this.messageId,
  });
}
