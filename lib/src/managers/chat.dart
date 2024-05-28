import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:webitel_portal_sdk/src/domain/entities/dialog.dart';
import 'package:webitel_portal_sdk/src/domain/services/chat_service.dart';
import 'package:webitel_portal_sdk/src/injection/injection.dart';

/// The `ChatManager` class is responsible for managing chat operations.
///
/// This class acts as a facade to interact with the underlying `ChatService`
/// for handling chat-related functionalities within the portal SDK.

@LazySingleton()
class ChatManager {
  // Dependency on the ChatService to handle chat-related operations.
  late final ChatService _chatService;

  /// Creates an instance of `ChatManager`.
  ///
  /// This constructor initializes the `ChatService` instance using dependency injection.
  ChatManager() {
    _chatService = getIt.get<ChatService>();
  }

  // /// Fetches a list of dialogs.
  // ///
  // /// This method interacts with the `_chatService` to fetch a list of dialogs.
  // /// It is currently commented out but can be uncommented and used as needed.
  // ///
  // /// Returns a [Future] that completes with a list of [Dialog] instances.
  // Future<List<Dialog>> fetchDialogs() async {
  //   return await _chatService.fetchDialogs();
  // }

  /// Fetches a specific service dialog.
  ///
  /// This method interacts with the `_chatService` to fetch a service dialog.
  ///
  /// Returns a [Future] that completes with a [Dialog] instance representing the service dialog.
  Future<Dialog> fetchServiceDialog() async {
    return await _chatService.fetchServiceDialog();
  }
}
