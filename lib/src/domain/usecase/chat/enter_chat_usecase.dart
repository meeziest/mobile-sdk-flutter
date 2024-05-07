import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:webitel_portal_sdk/src/domain/services/chat_service.dart';

abstract interface class EnterChatUsecase {
  Future<void> call({required String chatId});
}

@LazySingleton(as: EnterChatUsecase)
class EnterChatImplUseCase implements EnterChatUsecase {
  final ChatService _chatService;

  EnterChatImplUseCase(this._chatService);

  @override
  Future<void> call({required String chatId}) =>
      _chatService.enterChat(chatId: chatId);
}
