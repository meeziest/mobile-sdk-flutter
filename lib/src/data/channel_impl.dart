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
  Future<void> reconnectToStream() async => _chatService.reconnectToStream();

  /// Sends a ping request to the server to check the connection status.
  ///
  /// This method creates an Echo request with the data 'Client ping' and sends it to the
  /// server using the gRPC channel. It converts the server's response to a string and returns it.
  /// If a gRPC error occurs, it logs the error and returns an error message.
  ///
  /// Returns a [Future<String>] that completes with the server's response as a string,
  /// or an error message if the ping request fails.
  @override
  Future<String> ping() async => _chatService.ping();
}
