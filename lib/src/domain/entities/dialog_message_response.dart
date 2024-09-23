import 'package:webitel_portal_sdk/src/domain/entities/call_error.dart';
import 'package:webitel_portal_sdk/src/domain/entities/keyboard.dart';
import 'package:webitel_portal_sdk/src/domain/entities/media_file_response.dart';
import 'package:webitel_portal_sdk/src/domain/entities/message_type.dart';
import 'package:webitel_portal_sdk/src/domain/entities/peer.dart';
import 'package:webitel_portal_sdk/src/domain/entities/sender.dart';

/// Represents a response for a dialog message, including the message content,
/// associated media file, sender information, and any potential errors.
class DialogMessageResponse {
  /// The error associated with the message, if any.
  final CallError? error;

  /// The media file associated with the message.
  final MediaFileResponse file;

  /// The content of the dialog message.
  final String dialogMessageContent;

  /// The peer information of the sender.
  final PeerInfo peer;

  /// Timestamp of the message
  final int timestamp;

  /// The sender of the message.
  final Sender? sender;

  /// The type of the message.
  final MessageType? type;

  /// The unique identifier for the request.
  final String requestId;

  /// The ID of the chat where the message was sent (optional).
  final String? chatId;

  /// The ID of the message (optional).
  final int messageId;

  /// The check for input opened/closed..
  final bool input;

  /// The keyboard associated with the message (optional).
  final Keyboard? keyboard;

  /// Constructs a [DialogMessageResponse] instance with the given details.
  ///
  /// [error] The error associated with the message (optional).
  /// [messageType] The type of the message (optional).
  /// [sender] The sender of the message (optional).
  /// [chatId] The ID of the chat where the message was sent (optional).
  /// [messageId] The ID of the message (optional).
  /// [keyboard] The keyboard associated with the message (optional).
  /// [file] The media file associated with the message.
  /// [requestId] The unique identifier for the request.
  /// [dialogMessageContent] The content of the dialog message.
  /// [peer] The peer information of the sender.
  DialogMessageResponse({
    this.error,
    this.type,
    this.sender,
    this.chatId,
    required this.messageId,
    this.keyboard,
    required this.timestamp,
    required this.file,
    required this.requestId,
    required this.dialogMessageContent,
    required this.peer,
    required this.input,
  });

  /// Named constructor for creating an error instance of [DialogMessageResponse].
  ///
  /// This instance contains only error information and request ID, with default values for all other fields.
  ///
  /// [error] The error associated with the message.
  /// [requestId] The unique identifier for the request.
  DialogMessageResponse.error({
    required this.error,
    required this.requestId,
  })  : file = MediaFileResponse.initial(),
        peer = PeerInfo.initial(),
        sender = null,
        input = false,
        type = null,
        chatId = null,
        dialogMessageContent = '',
        timestamp = 0,
        messageId = 0,
        keyboard = null;
}
