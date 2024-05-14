import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:webitel_portal_sdk/src/backbone/message_helper.dart';
import 'package:webitel_portal_sdk/src/domain/entities/dialog.dart';
import 'package:webitel_portal_sdk/src/domain/entities/dialog_message/dialog_message_request.dart';
import 'package:webitel_portal_sdk/src/domain/entities/dialog_message/dialog_message_response.dart';
import 'package:webitel_portal_sdk/src/domain/entities/media_file/media_file_request.dart';
import 'package:webitel_portal_sdk/src/domain/services/chat_service.dart';
import 'package:webitel_portal_sdk/src/injection/injection.dart';

@LazySingleton(as: Dialog)
final class DialogImpl implements Dialog {
  @override
  final String id;
  @override
  final String topMessage;
  @override
  final Stream<DialogMessageResponse> onNewMessage;

// final StreamController<String> onMemberAdded;
// final StreamController<String> onMemberRemoved;
// final StreamController<String> onOperatorAdded;
// final StreamController<String> onOperatorRemoved;
// final StreamController<String> onMessageEdited;
// final StreamController<String> onMessageDeleted;
// final StreamController<String> onNewReaction;
// final StreamController<String> onTyping;

  late final ChatService _chatService;

  DialogImpl({
    required this.topMessage,
    required this.id,
    required this.onNewMessage,
  }) {
    _chatService = getIt.get<ChatService>();
  }

  DialogImpl.initial()
      : id = 'default_id',
        topMessage = 'No messages yet',
        onNewMessage = Stream.empty();

  @override
  Future<DialogMessageResponse> sendMessage({
    required String dialogMessageContent,
    required String requestId,
    required String messageType,
    required String mediaType,
    required String mediaName,
    required Stream<List<int>> mediaData,
  }) async {
    return await _chatService.sendMessage(
      chatId: id,
      message: DialogMessageRequest(
        messageType: MessageHelper.fromStringToEnum(messageType),
        dialogMessageContent: dialogMessageContent,
        requestId: requestId,
        file: MediaFileRequest(
          data: mediaData,
          name: mediaName,
          type: mediaType,
          requestId: requestId,
        ),
      ),
    );
  }

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
}
