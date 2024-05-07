import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:webitel_portal_sdk/src/domain/entities/dialog_message/dialog_message_response.dart';
import 'package:webitel_portal_sdk/src/domain/services/chat_service.dart';

abstract interface class ListenToMessagesUsecase {
  Future<StreamController<DialogMessageResponseEntity>> call();
}

@LazySingleton(as: ListenToMessagesUsecase)
class ListenToMessagesImplUseCase implements ListenToMessagesUsecase {
  final ChatService _chatService;

  ListenToMessagesImplUseCase(this._chatService);

  @override
  Future<StreamController<DialogMessageResponseEntity>> call() =>
      _chatService.listenToMessages();
}
