import 'package:webitel_portal_sdk/src/domain/entities/dialog_message/dialog_message_request.dart';
import 'package:webitel_portal_sdk/src/domain/entities/message_type.dart';
import 'package:webitel_portal_sdk/src/generated/portal/messages.pb.dart';

/// Helper class to determine and convert message types.
final class MessageHelper {
  // Constants representing different message types.
  static const MessageType outcomingMedia = MessageType.outcomingMedia;
  static const MessageType outcomingMessage = MessageType.outcomingMessage;
  static const MessageType incomingMedia = MessageType.incomingMedia;
  static const MessageType incomingMessage = MessageType.incomingMessage;

  /// Determines the message type based on the content of an [UpdateNewMessage].
  ///
  /// This method checks the properties of the [update] to determine if the message
  /// is an outgoing media, outgoing message, incoming media, or incoming message.
  ///
  /// Returns the corresponding [MessageType] based on the message content.
  ///
  /// Throws an [Exception] if the message type cannot be determined.
  ///
  /// [update] The update message to be checked.
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

  /// Determines the message type based on a [DialogMessageRequest].
  ///
  /// This method checks if the [dialogMessageRequestEntity] contains a file name
  /// to determine if the message is an outgoing media or outgoing message.
  ///
  /// Returns the corresponding [MessageType] based on the presence of a file name.
  ///
  /// [dialogMessageRequestEntity] The dialog message request to be checked.
  static MessageType determineMessageTypeRequest(
      DialogMessageRequest dialogMessageRequestEntity) {
    if (dialogMessageRequestEntity.file.name.isNotEmpty) {
      return MessageType.outcomingMedia;
    } else {
      return MessageType.outcomingMessage;
    }
  }

  /// Converts a string representation of a message type to a [MessageType] enum.
  ///
  /// This method matches the input [type] string (case-insensitive) to the corresponding
  /// [MessageType] enum value.
  ///
  /// Returns the corresponding [MessageType] based on the input string.
  ///
  /// Throws a [FormatException] if the input string does not match any known message type.
  ///
  /// [type] The string representation of the message type.
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
