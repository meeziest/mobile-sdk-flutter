import 'dart:async';

import 'package:webitel_portal_sdk/src/domain/entities/call_error.dart';
import 'package:webitel_portal_sdk/src/domain/entities/channel_status.dart';
import 'package:webitel_portal_sdk/src/domain/entities/connect.dart';

abstract interface class Channel {
  Stream<ChannelStatus> get onChannelStatusChange;

  Stream<Connect> get onConnectStreamStatusChange;

  Stream<CallError> get onError;

  Future<void> reconnectToStream();
}
