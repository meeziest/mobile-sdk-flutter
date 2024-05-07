import 'package:injectable/injectable.dart';
import 'package:webitel_portal_sdk/src/domain/entities/dialog_message/dialog_message_response.dart';
import 'package:webitel_portal_sdk/src/domain/services/chat_service.dart';

abstract interface class FetchUpdatesUseCase {
  Future<List<DialogMessageResponseEntity>> call({int? limit, String? offset});
}

@LazySingleton(as: FetchUpdatesUseCase)
class FetchUpdatesImplUseCase implements FetchUpdatesUseCase {
  final ChatService _chatService;

  FetchUpdatesImplUseCase(this._chatService);

  @override
  Future<List<DialogMessageResponseEntity>> call(
          {int? limit, String? offset}) =>
      _chatService.fetchUpdates(limit: limit, offset: offset);
}
