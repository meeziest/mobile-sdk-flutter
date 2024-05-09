import 'dart:async';

import 'package:webitel_portal_sdk/src/domain/entities/dialog_message/dialog_message_response.dart';

abstract class Dialog {
  String get id;

  String get topMessage;

  Stream<DialogMessageResponseEntity> get onNewMessage;

//  StreamController<String> get onMemberAdded;
//  StreamController<String> get onMemberRemoved;
//  StreamController<String> get onOperatorAdded;
//  StreamController<String> get onOperatorRemoved;
//  StreamController<String> get onMessageEdited;
//  StreamController<String> get onMessageDeleted;
//  StreamController<String> get onNewReaction;
//  StreamController<String> get onTyping;

  Future<DialogMessageResponseEntity> sendMessage({
    required String dialogMessageContent,
    required String requestId,
    required String messageType,
    required String mediaType,
    required String mediaName,
    required Stream<List<int>> mediaData,
  });

  Future<List<DialogMessageResponseEntity>> fetchMessages({
    int? limit,
    String? offset,
  });

  Future<List<DialogMessageResponseEntity>> fetchUpdates({
    int? limit,
    String? offset,
  });

  static final Map<String, Dialog> _cache = {};

  static String _generateCacheKey(String id, String topMessage) {
    return '$id-$topMessage';
  }

  static Dialog getOrCreate(String dialogId, String initialTopMessage,
      Dialog Function() createDialog) {
    final cacheKey = _generateCacheKey(dialogId, initialTopMessage);
    if (_cache.containsKey(cacheKey)) {
      return _cache[cacheKey]!;
    } else {
      final dialog = createDialog();
      _cache[cacheKey] = dialog;
      return dialog;
    }
  }
}
