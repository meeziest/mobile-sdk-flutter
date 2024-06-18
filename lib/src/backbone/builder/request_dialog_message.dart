import 'package:webitel_portal_sdk/src/domain/entities/dialog_message_request.dart';
import 'package:webitel_portal_sdk/src/domain/entities/media_file_request.dart';

final class RequestDialogMessageBuilder {
  late String _content;
  late String _requestId;
  late String _chatId;
  late String _messageId;

  late MediaFileRequest _file;

  RequestDialogMessageBuilder setContent(String content) {
    _content = content;
    return this;
  }

  RequestDialogMessageBuilder setRequestId(String requestId) {
    _requestId = requestId;
    return this;
  }

  RequestDialogMessageBuilder setChatId(String chatId) {
    _chatId = chatId;
    return this;
  }

  RequestDialogMessageBuilder setMessageId(String messageId) {
    _messageId = messageId;
    return this;
  }

  RequestDialogMessageBuilder setFile(MediaFileRequest file) {
    _file = file;
    return this;
  }

  DialogMessageRequest build() {
    return DialogMessageRequest(
      chatId: _chatId,
      content: _content,
      requestId: _requestId,
      messageId: _messageId,
      file: _file,
    );
  }
}
