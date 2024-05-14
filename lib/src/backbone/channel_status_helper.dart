import 'package:webitel_portal_sdk/src/domain/entities/channel_status.dart';

final class ChannelStatusHelper {
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
