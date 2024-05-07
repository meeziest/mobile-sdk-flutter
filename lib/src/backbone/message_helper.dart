import 'package:webitel_portal_sdk/src/domain/entities/dialog_message/dialog_message_request.dart';
import 'package:webitel_portal_sdk/src/domain/entities/message_type.dart';
import 'package:webitel_portal_sdk/src/generated/portal/messages.pb.dart';

class MessageHelper {
  static const MessageType outcomingMedia = MessageType.outcomingMedia;
  static const MessageType outcomingMessage = MessageType.outcomingMessage;
  static const MessageType incomingMedia = MessageType.incomingMedia;
  static const MessageType incomingMessage = MessageType.incomingMessage;

  static MessageType determineMessageTypeResponse(UpdateNewMessage update) {
    if (update.message.file.id.isNotEmpty &&
        update.message.from.name == 'You') {
      return MessageType.outcomingMedia;
    } else if (update.message.file.id.isEmpty &&
        update.message.from.name == 'You') {
      return MessageType.outcomingMessage;
    } else if (update.message.file.id.isNotEmpty &&
        update.message.from.name != 'You') {
      return MessageType.incomingMedia;
    } else if (update.message.file.id.isEmpty &&
        update.message.from.name != 'You') {
      return MessageType.incomingMessage;
    } else {
      throw Exception('Unknown type');
    }
  }

  static MessageType determineMessageTypeRequest(
      DialogMessageRequestEntity dialogMessageRequestEntity) {
    if (dialogMessageRequestEntity.file.name.isNotEmpty) {
      return MessageType.outcomingMedia;
    } else {
      return MessageType.outcomingMessage;
    }
  }

  static MessageType fromStringToEnum(String type) {
    switch (type.toLowerCase()) {
      case 'media':
        return MessageType.outcomingMedia;
      case 'message':
        return MessageType.outcomingMessage;
      default:
        throw FormatException("Invalid message type string: $type");
    }
  }
}
