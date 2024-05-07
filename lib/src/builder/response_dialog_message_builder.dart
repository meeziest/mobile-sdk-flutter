import 'package:webitel_portal_sdk/src/backbone/message_helper.dart';
import 'package:webitel_portal_sdk/src/domain/entities/dialog_message/dialog_message_response.dart';
import 'package:webitel_portal_sdk/src/domain/entities/media_file/media_file_response.dart';
import 'package:webitel_portal_sdk/src/domain/entities/peer.dart';
import 'package:webitel_portal_sdk/src/generated/portal/messages.pb.dart';

class ResponseDialogMessageBuilder {
  late String _dialogMessageContent;
  late String _requestId;
  late String _chatId;
  late String _messageId;
  late String _id;
  late String _userId;
  late UpdateNewMessage _update;
  late MediaFileResponseEntity _file;

  ResponseDialogMessageBuilder setDialogMessageContent(
      String dialogMessageContent) {
    _dialogMessageContent = dialogMessageContent;
    return this;
  }

  ResponseDialogMessageBuilder setRequestId(String requestId) {
    _requestId = requestId;
    return this;
  }

  ResponseDialogMessageBuilder setChatId(String chatId) {
    _chatId = chatId;
    return this;
  }

  ResponseDialogMessageBuilder setMessageId(String messageId) {
    _messageId = messageId;
    return this;
  }

  ResponseDialogMessageBuilder setUpdate(UpdateNewMessage update) {
    _update = update;
    return this;
  }

  ResponseDialogMessageBuilder setId(String id) {
    _id = id;
    return this;
  }

  ResponseDialogMessageBuilder setUserUd(String userId) {
    _userId = userId;
    return this;
  }

  ResponseDialogMessageBuilder setFile(MediaFileResponseEntity file) {
    _file = file;
    return this;
  }

  DialogMessageResponseEntity build() {
    final sender =
        _update.message.from.id == _userId ? Sender.user : Sender.operator;

    final messageType = MessageHelper.determineMessageTypeResponse(_update);

    final peerInfo = PeerInfo(
      id: _update.message.from.id,
      name: _update.message.from.name,
      type: _update.message.from.type,
    );

    return DialogMessageResponseEntity(
      sender: sender,
      messageType: messageType,
      chatId: _chatId,
      dialogMessageContent: _dialogMessageContent,
      requestId: _requestId,
      peer: peerInfo,
      messageId: _messageId,
      file: _file,
      id: _id,
    );
  }
}
