import 'package:injectable/injectable.dart';
import 'package:webitel_portal_sdk/src/domain/entities/dialog_message/dialog_message_request.dart';
import 'package:webitel_portal_sdk/src/domain/entities/dialog_message/dialog_message_response.dart';
import 'package:webitel_portal_sdk/src/domain/services/chat_service.dart';

abstract interface class SendMessageUseCase {
  Future<DialogMessageResponseEntity> call(
      {required DialogMessageRequestEntity message});
}

@LazySingleton(as: SendMessageUseCase)
class SendMessageImplUseCase implements SendMessageUseCase {
  final ChatService _chatService;

  SendMessageImplUseCase(this._chatService);

  @override
  Future<DialogMessageResponseEntity> call(
          {required DialogMessageRequestEntity message}) =>
      _chatService.sendMessage(message: message);
}
