import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:webitel_portal_sdk/src/domain/services/chat_service.dart';

abstract interface class ExitChatUsecase {
  Future<void> call();
}

@LazySingleton(as: ExitChatUsecase)
class ExitChatImplUseCase implements ExitChatUsecase {
  final ChatService _chatService;

  ExitChatImplUseCase(this._chatService);

  @override
  Future<void> call() => _chatService.exitChat();
}
