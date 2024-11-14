import 'package:webitel_portal_sdk/src/domain/entities/button.dart';
import 'package:webitel_portal_sdk/src/domain/entities/dialog_message_response.dart';
import 'package:webitel_portal_sdk/src/domain/entities/keyboard.dart';
import 'package:webitel_portal_sdk/src/domain/entities/media_file_response.dart';
import 'package:webitel_portal_sdk/src/domain/entities/peer.dart';
import 'package:webitel_portal_sdk/src/domain/entities/sender.dart';
import 'package:webitel_portal_sdk/src/generated/chat/messages/message.pb.dart'
    as pb;
import 'package:webitel_portal_sdk/src/generated/chat/messages/peer.pb.dart'
    as pb;

final class MessagesListMessageBuilder {
  late String _chatId;
  late String _userId;
  late List<pb.Message> _messages;
  late List<pb.Peer> _peers;

  MessagesListMessageBuilder setChatId(String chatId) {
    _chatId = chatId;
    return this;
  }

  MessagesListMessageBuilder setUserId(String userId) {
    _userId = userId;
    return this;
  }

  MessagesListMessageBuilder setMessages(List<pb.Message> messages) {
    _messages = messages;
    return this;
  }

  MessagesListMessageBuilder setPeers(List<pb.Peer> peers) {
    _peers = peers;
    return this;
  }

  List<DialogMessageResponse> build() {
    return _messages.map((message) {
      final peerIndex = int.parse(message.from.id) - 1;
      final messageType =
          _peers[peerIndex].id == _userId ? Sender.user : Sender.operator;

      // Process the keyboard if it's not null
      Keyboard? keyboard;
      if (message.keyboard.buttons.isNotEmpty) {
        keyboard = Keyboard(
          buttons: message.keyboard.buttons.map((buttonRow) {
            return buttonRow.row
                .map((button) {
                  // Check if the button has either a code or URL
                  if (button.code.isNotEmpty || button.url.isNotEmpty) {
                    return Button(
                      text: button.text,
                      code: button.code,
                      url: button.url,
                    );
                  }
                  return null;
                })
                .whereType<Button>()
                .toList();
          }).toList(),
        );
      }

      return DialogMessageResponse(
        input: message.keyboard.noInput,
        keyboard: keyboard ?? Keyboard.initial(),
        timestamp: message.date.toInt(),
        messageId: message.id.toInt(),
        chatId: _chatId,
        sender: messageType,
        dialogMessageContent: message.text,
        peer: PeerInfo(
          name: _peers[peerIndex].name,
          type: _peers[peerIndex].type,
          id: _peers[peerIndex].id,
        ),
        file: MediaFileResponse(
          id: message.file.id,
          size: message.file.size.toInt(),
          bytes: [],
          name: message.file.name,
          type: message.file.type,
        ),
        requestId: '',
      );
    }).toList();
  }
}
