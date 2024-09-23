import 'package:webitel_portal_sdk/src/domain/entities/upload_file.dart';

/// Represents a request to send a dialog message, which may include a media file.
class DialogMessageRequest {
  /// The media file associated with the message.
  final UploadFile uploadFile;

  /// The content of the message.
  final String content;

  /// The unique identifier for the request.
  final String requestId;

  /// The ID of the chat where the message is to be sent (optional).
  final String? chatId;

  /// The ID of the message being replied to or edited (optional).
  final String? messageId;

  /// Constructs a [DialogMessageRequest] instance with the given details.
  ///
  /// [requestId] The unique identifier for the request.
  /// [content] The content of the message.
  /// [file] The media file associated with the message.
  /// [chatId] The ID of the chat where the message is to be sent (optional).
  /// [messageId] The ID of the message being replied to or edited (optional).
  DialogMessageRequest({
    required this.requestId,
    required this.content,
    required this.uploadFile,
    this.chatId,
    this.messageId,
  });
}
