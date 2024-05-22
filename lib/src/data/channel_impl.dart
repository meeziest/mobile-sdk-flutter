import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:webitel_portal_sdk/src/domain/entities/call_error.dart';
import 'package:webitel_portal_sdk/src/domain/entities/channel.dart';
import 'package:webitel_portal_sdk/src/domain/entities/channel_status.dart';
import 'package:webitel_portal_sdk/src/domain/entities/connect.dart';
import 'package:webitel_portal_sdk/src/domain/services/chat_service.dart';
import 'package:webitel_portal_sdk/src/injection/injection.dart';

/// Implementation of [Channel] that interacts with the [ChatService].
@LazySingleton(as: Channel)
final class ChannelImpl implements Channel {
  // Instance of the ChatService to handle chat-related operations.
  late final ChatService _chatService;

  /// Constructor that initializes the [ChatService] instance using dependency injection.
  ChannelImpl() {
    _chatService = getIt.get<ChatService>();
  }

  /// Stream for monitoring changes in the channel status.
  ///
  /// Returns a [Stream] of [ChannelStatus] updates.
  @override
  Stream<ChannelStatus> get onChannelStatusChange =>
      _chatService.onChannelStatusChange().stream;

  /// Stream for monitoring changes in the connection stream status.
  ///
  /// Returns a [Stream] of [Connect] updates.
  @override
  Stream<Connect> get onConnectStreamStatusChange =>
      _chatService.onConnectStreamStatusChange().stream;

  /// Stream for monitoring errors in the chat service.
  ///
  /// Returns a [Stream] of [CallError] updates.
  @override
  Stream<CallError> get onError => _chatService.onError().stream;

  /// Attempts to reconnect to the chat stream.
  ///
  /// Returns a [Future] that completes when the reconnection attempt is done.
  @override
  Future<void> reconnectToStream() => _chatService.reconnectToStream();
}
