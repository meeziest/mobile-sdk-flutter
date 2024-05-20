import 'dart:async';

import 'package:webitel_portal_sdk/src/domain/entities/call_error.dart';
import 'package:webitel_portal_sdk/src/domain/entities/dialog_message/dialog_message_response.dart';
import 'package:webitel_portal_sdk/src/domain/entities/media_file/media_file_response.dart';

abstract interface class Dialog {
  CallError? get error;

  String get id;

  String get topMessage;

  Stream<DialogMessageResponse> get onNewMessage;

  Stream<MediaFileResponse> downloadFile({required String fileId});

//  StreamController<String> get onMemberAdded;
//  StreamController<String> get onMemberRemoved;
//  StreamController<String> get onOperatorAdded;
//  StreamController<String> get onOperatorRemoved;
//  StreamController<String> get onMessageEdited;
//  StreamController<String> get onMessageDeleted;
//  StreamController<String> get onNewReaction;
//  StreamController<String> get onTyping;

  Future<DialogMessageResponse> sendMessage({
    String mediaType,
    String mediaName,
    Stream<List<int>> mediaData,
    required String content,
    required String requestId,
  });

  Future<List<DialogMessageResponse>> fetchMessages({
    int? limit,
    int? offset,
  });

  Future<List<DialogMessageResponse>> fetchUpdates({
    int? limit,
    int? offset,
  });
}
