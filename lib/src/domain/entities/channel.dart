import 'dart:async';

import 'package:webitel_portal_sdk/src/domain/entities/call_error.dart';
import 'package:webitel_portal_sdk/src/domain/entities/channel_status.dart';
import 'package:webitel_portal_sdk/src/domain/entities/connect.dart';

/// Interface for managing communication channels, providing methods for
/// handling status changes, errors, reconnection, and pinging the server.
abstract interface class Channel {
  /// Stream of channel status changes.
  ///
  /// Returns a stream of [ChannelStatus] indicating the current status of the channel.
  Stream<ChannelStatus> get onChannelStatusChange;

  /// Stream of connection status changes.
  ///
  /// Returns a stream of [Connect] indicating the current status of the connection.
  Stream<Connect> get onConnectStreamStatusChange;

  /// Stream of errors occurring in the channel.
  ///
  /// Returns a stream of [CallError] indicating the errors encountered.
  Stream<CallError> get onError;

  /// Attempts to reconnect to the stream.
  ///
  /// Returns a [Future] that completes when the reconnection attempt is done.
  Future<void> reconnectToStream();
}
