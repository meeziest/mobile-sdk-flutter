import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:webitel_portal_sdk/src/domain/entities/channel.dart';
import 'package:webitel_portal_sdk/src/domain/entities/channel_status.dart';
import 'package:webitel_portal_sdk/src/domain/entities/connect.dart';
import 'package:webitel_portal_sdk/src/domain/entities/error.dart';
import 'package:webitel_portal_sdk/src/domain/services/chat_service.dart';
import 'package:webitel_portal_sdk/src/injection/injection.dart';

@LazySingleton(as: Channel)
class ChannelImpl implements Channel {
  late final ChatService _chatService;

  ChannelImpl() {
    _chatService = getIt.get<ChatService>();
  }

  @override
  Stream<ChannelStatus> get onChannelStatusChange =>
      _chatService.onChannelStatusChange().stream;

  @override
  Stream<ConnectEntity> get onConnectStreamStatusChange =>
      _chatService.onConnectStreamStatusChange().stream;

  @override
  Stream<ErrorEntity> get onError => _chatService.onError().stream;
}
