import 'package:webitel_portal_sdk/src/domain/entities/dialog_message/dialog_message_response.dart';
import 'package:webitel_portal_sdk/src/domain/entities/media_file/media_file_response.dart';
import 'package:webitel_portal_sdk/src/domain/entities/peer.dart';
import 'package:webitel_portal_sdk/src/generated/chat/messages/message.pb.dart';
import 'package:webitel_portal_sdk/src/generated/chat/messages/peer.pb.dart';

class MessagesListMessageBuilder {
  late String _chatId;
  late String _userId;
  late List<Message> _messages;
  late List<Peer> _peers;

  MessagesListMessageBuilder setChatId(String chatId) {
    _chatId = chatId;
    return this;
  }

  MessagesListMessageBuilder setUserId(String userId) {
    _userId = userId;
    return this;
  }

  MessagesListMessageBuilder setMessages(List<Message> messages) {
    _messages = messages;
    return this;
  }

  MessagesListMessageBuilder setPeers(List<Peer> peers) {
    _peers = peers;
    return this;
  }

  List<DialogMessageResponseEntity> build() {
    return _messages.map((message) {
      final peerIndex = int.parse(message.from.id) - 1;
      final messageType =
          _peers[peerIndex].id == _userId ? Sender.user : Sender.operator;

      return DialogMessageResponseEntity(
        id: message.file.id,
        chatId: _chatId,
        sender: messageType,
        dialogMessageContent: message.text,
        peer: PeerInfo(
          name: message.from.name,
          type: message.chat.peer.type,
          id: message.chat.peer.id,
        ),
        file: MediaFileResponseEntity(
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
