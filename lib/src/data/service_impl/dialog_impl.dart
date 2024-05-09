import 'dart:async';

import 'package:webitel_portal_sdk/src/backbone/message_helper.dart';
import 'package:webitel_portal_sdk/src/domain/entities/dialog.dart';
import 'package:webitel_portal_sdk/src/domain/entities/dialog_message/dialog_message_request.dart';
import 'package:webitel_portal_sdk/src/domain/entities/dialog_message/dialog_message_response.dart';
import 'package:webitel_portal_sdk/src/domain/entities/media_file/media_file_request.dart';
import 'package:webitel_portal_sdk/src/domain/services/chat_service.dart';
import 'package:webitel_portal_sdk/src/injection/injection.dart';

class DialogImpl implements Dialog {
  @override
  final String id;
  @override
  final String topMessage;
  @override
  final Stream<DialogMessageResponseEntity> onNewMessage;

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
  Future<DialogMessageResponseEntity> sendMessage({
    required String dialogMessageContent,
    required String requestId,
    required String messageType,
    required String mediaType,
    required String mediaName,
    required Stream<List<int>> mediaData,
  }) async {
    return await _chatService.sendMessage(
      chatId: id,
      message: DialogMessageRequestEntity(
        messageType: MessageHelper.fromStringToEnum(messageType),
        dialogMessageContent: dialogMessageContent,
        requestId: requestId,
        file: MediaFileRequestEntity(
          data: mediaData,
          name: mediaName,
          type: mediaType,
          requestId: requestId,
        ),
      ),
    );
  }

  @override
  Future<List<DialogMessageResponseEntity>> fetchMessages({
    int? limit,
    String? offset,
  }) async {
    return await _chatService.fetchMessages(
      chatId: id,
      limit: limit,
      offset: offset,
    );
  }

  @override
  Future<List<DialogMessageResponseEntity>> fetchUpdates({
    int? limit,
    String? offset,
  }) async {
    return await _chatService.fetchMessages(
      chatId: id,
      limit: limit,
      offset: offset,
    );
  }
}
