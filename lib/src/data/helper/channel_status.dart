import 'package:webitel_portal_sdk/src/domain/entities/channel_status.dart';

/// Helper class to convert a status string to a [ChannelStatus] enum.
final class ChannelStatusHelper {
  /// Converts a status string to a corresponding [ChannelStatus] enum value.
  ///
  /// This method takes a status string as input and returns the corresponding
  /// [ChannelStatus] enum value. If the input string does not match any of the
  /// defined statuses, an [ArgumentError] is thrown.
  ///
  /// [status] The status string to convert.
  ///
  /// Returns the corresponding [ChannelStatus] enum value.
  ///
  /// Throws [ArgumentError] if the status string is invalid.
  static ChannelStatus toChannelStatus(String status) {
    switch (status) {
      case "connecting":
        return ChannelStatus.connecting;
      case "ready":
        return ChannelStatus.ready;
      case "transientFailure":
        return ChannelStatus.transientFailure;
      case "idle":
        return ChannelStatus.idle;
      case "shutdown":
        return ChannelStatus.shutdown;
      default:
        throw ArgumentError('Invalid status string: $status');
    }
  }
}
