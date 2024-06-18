import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:webitel_portal_sdk/src/domain/entities/call_error.dart';
import 'package:webitel_portal_sdk/src/domain/entities/dialog.dart';
import 'package:webitel_portal_sdk/src/domain/entities/dialog_message_request.dart';
import 'package:webitel_portal_sdk/src/domain/entities/dialog_message_response.dart';
import 'package:webitel_portal_sdk/src/domain/entities/download.dart';
import 'package:webitel_portal_sdk/src/domain/entities/media_file_request.dart';
import 'package:webitel_portal_sdk/src/domain/entities/media_file_response.dart';
import 'package:webitel_portal_sdk/src/domain/entities/portal_chat_member.dart';
import 'package:webitel_portal_sdk/src/domain/entities/postback.dart';
import 'package:webitel_portal_sdk/src/domain/services/chat_service.dart';
import 'package:webitel_portal_sdk/src/injection/injection.dart';

/// Implementation of [Dialog] that provides functionalities for dialog operations.
@LazySingleton(as: Dialog)
final class DialogImpl implements Dialog {
  /// The unique identifier for the dialog.
  @override
  final String id;

  /// The top message in the dialog.
  @override
  final String topMessage;

  /// The error associated with the dialog, if any.
  @override
  final CallError? error;

  /// Stream [DialogMessageResponse] for new messages in the dialog.
  @override
  final Stream<DialogMessageResponse> onNewMessage;

  /// Stream [PortalChatMember] for new member added to the chat..
  @override
  final Stream<PortalChatMember> onMemberAdded;

  /// Stream [PortalChatMember] for member left the chat..
  @override
  final Stream<PortalChatMember> onMemberLeft;

  // Dependency on the ChatService to handle chat-related operations.
  late final ChatService _chatService;

  /// Constructor for initializing a [DialogImpl] instance.
  ///
  /// [id] The unique identifier for the dialog.
  /// [topMessage] The top message in the dialog.
  /// [onNewMessage] The stream for new messages in the dialog.
  /// [error] The error associated with the dialog, if any.
  DialogImpl({
    required this.id,
    required this.topMessage,
    required this.onNewMessage,
    required this.onMemberAdded,
    required this.onMemberLeft,
    this.error,
  }) {
    _chatService = getIt.get<ChatService>();
  }

  /// Named constructor for creating an initial/default instance of [DialogImpl].
  DialogImpl.initial()
      : id = 'default_id',
        topMessage = 'No messages yet',
        error = CallError(statusCode: '', errorMessage: ''),
        onNewMessage = Stream.empty(),
        onMemberLeft = Stream.empty(),
        onMemberAdded = Stream.empty();

  /// Sends a message in the dialog.
  ///
  /// [mediaType] The type of the media (optional).
  /// [mediaName] The name of the media (optional).
  /// [mediaData] The stream of media data (optional).
  /// [content] The content of the message.
  /// [requestId] The unique identifier for the request.
  ///
  /// Returns a [Future] that completes with a [DialogMessageResponse].
  @override
  Future<DialogMessageResponse> sendMessage({
    String? mediaType,
    String? mediaName,
    Stream<List<int>>? mediaData,
    required String content,
    required String requestId,
  }) async {
    return await _chatService.sendMessage(
      chatId: id,
      message: DialogMessageRequest(
        content: content,
        requestId: requestId,
        file: MediaFileRequest(
          data: mediaData ?? Stream<List<int>>.empty(),
          name: mediaName ?? '',
          type: mediaType ?? '',
          requestId: requestId,
        ),
      ),
    );
  }

  /// Sends a postback in the dialog.
  ///
  /// [postback] The postback object,
  /// [requestId] The unique identifier for the request.
  ///
  /// Returns a [Future] that completes with a [DialogMessageResponse].
  @override
  Future<DialogMessageResponse> sendPostback({
    required Postback postback,
    required String requestId,
  }) async {
    return await _chatService.sendPostback(
      chatId: id,
      requestId: requestId,
      postback: postback,
    );
  }

  /// Fetches messages in the dialog.
  ///
  /// [limit] The maximum number of messages to fetch (optional).
  /// [offset] The offset from which to start fetching messages (optional).
  ///
  /// Returns a [Future] that completes with a list of [DialogMessageResponse].
  @override
  Future<List<DialogMessageResponse>> fetchMessages({
    int? limit,
    int? offset,
  }) async {
    return await _chatService.fetchMessages(
      chatId: id,
      limit: limit,
      offset: offset,
    );
  }

  /// Fetches updates in the dialog.
  ///
  /// [limit] The maximum number of updates to fetch (optional).
  /// [offset] The offset from which to start fetching updates (optional).
  ///
  /// Returns a [Future] that completes with a list of [DialogMessageResponse].
  @override
  Future<List<DialogMessageResponse>> fetchUpdates({
    int? limit,
    int? offset,
  }) async {
    return await _chatService.fetchMessages(
      chatId: id,
      limit: limit,
      offset: offset,
    );
  }

  /// Downloads a media file associated with a dialog.
  ///
  /// [fileId] The ID of the file to be downloaded.
  ///
  /// Returns a stream of [MediaFileResponse] representing the downloaded file.
  @override
  Download downloadFile({required String fileId, int? offset}) =>
      _chatService.downloadFile(
        fileId: fileId,
        offset: offset,
      );
}
