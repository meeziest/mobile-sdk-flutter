import 'package:webitel_portal_sdk/src/domain/entities/dialog_message/dialog_message_request.dart';
import 'package:webitel_portal_sdk/src/domain/entities/media_file/media_file_request.dart';
import 'package:webitel_portal_sdk/src/domain/entities/message_type.dart';

class RequestDialogMessageBuilder {
  late String _dialogMessageContent;
  late String _requestId;
  late String _chatId;
  late String _messageId;
  late MessageType _messageType;

  late MediaFileRequestEntity _file;

  RequestDialogMessageBuilder setDialogMessageContent(
      String dialogMessageContent) {
    _dialogMessageContent = dialogMessageContent;
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

  RequestDialogMessageBuilder setFile(MediaFileRequestEntity file) {
    _file = file;
    return this;
  }

  RequestDialogMessageBuilder setMessageType(MessageType messageType) {
    _messageType = messageType;
    return this;
  }

  DialogMessageRequestEntity build() {
    return DialogMessageRequestEntity(
      messageType: _messageType,
      chatId: _chatId,
      dialogMessageContent: _dialogMessageContent,
      requestId: _requestId,
      messageId: _messageId,
      file: _file,
    );
  }
}
