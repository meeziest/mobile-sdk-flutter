import 'package:webitel_portal_sdk/src/backbone/helper/message.dart';
import 'package:webitel_portal_sdk/src/domain/entities/dialog_message_response.dart';
import 'package:webitel_portal_sdk/src/domain/entities/keyboard.dart';
import 'package:webitel_portal_sdk/src/domain/entities/media_file_response.dart';
import 'package:webitel_portal_sdk/src/domain/entities/peer.dart';
import 'package:webitel_portal_sdk/src/domain/entities/sender.dart';
import 'package:webitel_portal_sdk/src/generated/portal/messages.pb.dart';

final class ResponseDialogMessageBuilder {
  late String _dialogMessageContent;
  late String _requestId;
  late String _chatId;
  late int _timestamp;
  late int _messageId;
  late bool _input;
  late String _userId;
  late UpdateNewMessage _update;
  late MediaFileResponse? _file;
  Keyboard? _keyboard;

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

  ResponseDialogMessageBuilder setInput(bool input) {
    _input = input;
    return this;
  }

  ResponseDialogMessageBuilder setKeyboard(Keyboard keyboard) {
    // Add a setter for Keyboard
    _keyboard = keyboard;
    return this;
  }

  DialogMessageResponse build() {
    final sender =
        _update.message.from.name == 'You' ? Sender.user : Sender.operator;

    final type = MessageHelper.determineMessageTypeResponse(_update);

    final peerInfo = PeerInfo(
      id: _update.message.from.id,
      name: _update.message.from.name,
      type: _update.message.from.type,
    );

    return DialogMessageResponse(
      input: _input,
      timestamp: _timestamp,
      sender: sender,
      type: type,
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
      keyboard: _keyboard,
    );
  }
}
