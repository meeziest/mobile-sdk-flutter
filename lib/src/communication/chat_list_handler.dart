import 'package:webitel_portal_sdk/src/domain/usecase/chat/enter_chat_usecase.dart';
import 'package:webitel_portal_sdk/src/domain/usecase/chat/exit_chat_usecase.dart';
import 'package:webitel_portal_sdk/src/domain/usecase/chat_list/fetch_dialogs_usecase.dart';
import 'package:webitel_portal_sdk/src/injection/injection.dart';

class ChatListHandler {
  late final EnterChatUsecase _enterChatUsecase;
  late final ExitChatUsecase _exitChatUsecase;
  late final FetchDialogsUseCase _fetchDialogsUseCase;

  ChatListHandler() {
    _fetchDialogsUseCase = getIt.get<FetchDialogsUseCase>();
    _enterChatUsecase = getIt.get<EnterChatUsecase>();
    _exitChatUsecase = getIt.get<ExitChatUsecase>();
  }

  Future<void> fetchDialogs() async {
    await _fetchDialogsUseCase();
  }

  Future<void> exitChat() async {
    await _exitChatUsecase();
  }

  Future<void> enterChat({required String chatId}) async {
    await _enterChatUsecase(chatId: chatId);
  }
}
