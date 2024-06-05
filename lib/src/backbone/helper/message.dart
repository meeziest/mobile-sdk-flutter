import 'package:webitel_portal_sdk/src/domain/entities/dialog_message/dialog_message_request.dart';
import 'package:webitel_portal_sdk/src/domain/entities/message_type.dart';
import 'package:webitel_portal_sdk/src/generated/portal/messages.pb.dart';

/// Helper class to determine and convert message types.
final class MessageHelper {
  // Constants representing different message types.
  static const MessageType text = MessageType.text;
  static const MessageType media = MessageType.media;

  /// Determines the message type based on the content of an [UpdateNewMessage].
  ///
  /// This method checks the properties of the [update] to determine if the message
  /// is an media, text or button.
  ///
  /// Returns the corresponding [MessageType] based on the message content.
  ///
  /// Throws an [Exception] if the message type cannot be determined.
  ///
  /// [update] The update message to be checked.
  /// Determines the message type based on the update.
  ///
  static MessageType determineMessageTypeResponse(UpdateNewMessage update) {
    if (update.message.keyboard.buttons.isNotEmpty) {
      return MessageType.button;
    } else if (update.message.file.id.isNotEmpty) {
      return MessageType.media;
    } else {
      return MessageType.text;
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
      return MessageType.media;
    } else {
      return MessageType.text;
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
// static MessageType fromStringToEnum(String type) {
//   switch (type.toLowerCase()) {
//     case 'media':
//       return MessageType.media;
//     case 'message':
//       return MessageType.text;
//     default:
//       throw FormatException("Invalid message type string: $type");
//   }
// }
}
