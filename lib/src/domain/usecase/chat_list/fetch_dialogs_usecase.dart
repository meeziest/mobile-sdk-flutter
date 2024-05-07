import 'package:injectable/injectable.dart';
import 'package:webitel_portal_sdk/src/domain/services/chat_list_service.dart';

abstract interface class FetchDialogsUseCase {
  Future<void> call();
}

@LazySingleton(as: FetchDialogsUseCase)
class FetchDialogsImplUseCase implements FetchDialogsUseCase {
  final ChatListService _chatListServiceService;

  FetchDialogsImplUseCase(this._chatListServiceService);

  @override
  Future<void> call() => _chatListServiceService.fetchDialogs();
}
