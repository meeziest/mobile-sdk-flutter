import 'package:webitel_portal_sdk/src/domain/entities/media_file/media_file_response.dart';
import 'package:webitel_portal_sdk/src/domain/entities/message_type.dart';
import 'package:webitel_portal_sdk/src/domain/entities/peer.dart';

enum Sender { user, operator, bot }

class DialogMessageResponse {
  final int id;
  final MediaFileResponse file;
  final String dialogMessageContent;
  final PeerInfo peer;
  final Sender? sender;
  final MessageType? messageType;
  final String requestId;
  final String? chatId;
  final String? messageId;

  DialogMessageResponse({
    this.messageType,
    this.sender,
    this.chatId,
    this.messageId,
    required this.id,
    required this.file,
    required this.requestId,
    required this.dialogMessageContent,
    required this.peer,
  });
}
