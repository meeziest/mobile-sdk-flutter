import 'package:injectable/injectable.dart';
import 'package:webitel_portal_sdk/src/domain/entities/dialog_message/dialog_message_response.dart';
import 'package:webitel_portal_sdk/src/domain/services/chat_service.dart';

abstract interface class FetchMessagesUseCase {
  Future<List<DialogMessageResponseEntity>> call({int? limit, String? offset});
}

@LazySingleton(as: FetchMessagesUseCase)
class FetchMessagesImplUseCase implements FetchMessagesUseCase {
  final ChatService _chatService;

  FetchMessagesImplUseCase(this._chatService);

  @override
  Future<List<DialogMessageResponseEntity>> call(
          {int? limit, String? offset}) =>
      _chatService.fetchMessages(limit: limit, offset: offset);
}
