import 'package:webitel_portal_sdk/src/backbone/helper/message.dart';
import 'package:webitel_portal_sdk/src/domain/entities/dialog_message/dialog_message_response.dart';
import 'package:webitel_portal_sdk/src/domain/entities/media_file/media_file_response.dart';
import 'package:webitel_portal_sdk/src/domain/entities/peer.dart';
import 'package:webitel_portal_sdk/src/generated/portal/messages.pb.dart';

final class ResponseDialogMessageBuilder {
  late String _dialogMessageContent;
  late String _requestId;
  late String _chatId;
  late int _timestamp;
  late int _messageId;
  late String _userId;
  late UpdateNewMessage _update;
  late MediaFileResponse? _file;

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

  ResponseDialogMessageBuilder setMessageId(int messageId) {
    _messageId = messageId;
    return this;
  }

  ResponseDialogMessageBuilder setUpdate(UpdateNewMessage update) {
    _update = update;
    return this;
  }

  ResponseDialogMessageBuilder setUserUd(String userId) {
    _userId = userId;
    return this;
  }

  ResponseDialogMessageBuilder setFile(MediaFileResponse file) {
    _file = file;
    return this;
  }

  ResponseDialogMessageBuilder setTimestamp(int timestamp) {
    _timestamp = timestamp;
    return this;
  }

  DialogMessageResponse build() {
    final sender =
        _update.message.from.id == _userId ? Sender.user : Sender.operator;

    final messageType = MessageHelper.determineMessageTypeResponse(_update);

    final peerInfo = PeerInfo(
      id: _update.message.from.id,
      name: _update.message.from.name,
      type: _update.message.from.type,
    );

    return DialogMessageResponse(
      timestamp: _timestamp,
      sender: sender,
      messageType: messageType,
      chatId: _chatId,
      dialogMessageContent: _dialogMessageContent,
      requestId: _requestId,
      peer: peerInfo,
      messageId: _messageId,
      file: _file ??
          MediaFileResponse(
            size: 0,
            bytes: [],
            name: '',
            type: '',
            id: '',
          ),
    );
  }
}
