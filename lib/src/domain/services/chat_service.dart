import 'dart:async';

import 'package:webitel_portal_sdk/src/domain/entities/dialog_message/dialog_message_request.dart';
import 'package:webitel_portal_sdk/src/domain/entities/dialog_message/dialog_message_response.dart';

abstract interface class ChatService {
  Future<List<DialogMessageResponseEntity>> fetchMessages({
    int? limit,
    String? offset,
  });

  Future<List<DialogMessageResponseEntity>> fetchUpdates({
    int? limit,
    String? offset,
  });

  Future<DialogMessageResponseEntity> sendMessage(
      {required DialogMessageRequestEntity message});

  Future<StreamController<DialogMessageResponseEntity>> listenToMessages();

  Future<void> enterChat({required String chatId});

  Future<void> exitChat();
}
