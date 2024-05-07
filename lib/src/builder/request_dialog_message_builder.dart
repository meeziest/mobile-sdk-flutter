import 'package:webitel_portal_sdk/src/domain/entities/dialog_message/dialog_message_request.dart';
import 'package:webitel_portal_sdk/src/domain/entities/media_file/media_file_request.dart';
import 'package:webitel_portal_sdk/src/domain/entities/message_type.dart';
import 'package:webitel_portal_sdk/src/domain/entities/peer.dart';
import 'package:webitel_portal_sdk/src/generated/portal/messages.pb.dart';

class RequestDialogMessageBuilder {
  late String _dialogMessageContent;
  late String _requestId;
  late String _chatId;
  late String _messageId;
  late MessageType _messageType;
  late UpdateNewMessage _update;
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

  RequestDialogMessageBuilder setUpdate(UpdateNewMessage update) {
    _update = update;
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
    final peerInfo = PeerInfo(
      id: _update.message.from.id,
      name: _update.message.from.name,
      type: _update.message.from.type,
    );

    return DialogMessageRequestEntity(
      messageType: _messageType,
      chatId: _chatId,
      dialogMessageContent: _dialogMessageContent,
      requestId: _requestId,
      peer: peerInfo,
      messageId: _messageId,
      file: _file,
    );
  }
}
