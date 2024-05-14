import 'dart:async';

import 'package:webitel_portal_sdk/src/domain/entities/dialog.dart';
import 'package:webitel_portal_sdk/src/domain/services/chat_service.dart';
import 'package:webitel_portal_sdk/src/injection/injection.dart';

class ChatManager {
  late final ChatService _chatService;

  ChatManager() {
    _chatService = getIt.get<ChatService>();
  }

  // Future<List<Dialog>> fetchDialogs() async {
  //   return await _chatService.fetchDialogs();
  // }

  Future<Dialog> fetchServiceDialog() async {
    return await _chatService.fetchServiceDialog();
  }
}
