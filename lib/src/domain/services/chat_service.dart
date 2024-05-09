import 'dart:async';

import 'package:webitel_portal_sdk/src/domain/entities/channel_status.dart';
import 'package:webitel_portal_sdk/src/domain/entities/connect.dart';
import 'package:webitel_portal_sdk/src/domain/entities/dialog.dart';
import 'package:webitel_portal_sdk/src/domain/entities/dialog_message/dialog_message_request.dart';
import 'package:webitel_portal_sdk/src/domain/entities/dialog_message/dialog_message_response.dart';

abstract interface class ChatService {
  Future<List<DialogMessageResponseEntity>> fetchMessages({
    required String chatId,
    int? limit,
    String? offset,
  });

  Future<List<DialogMessageResponseEntity>> fetchUpdates({
    required String chatId,
    int? limit,
    String? offset,
  });

  Future<DialogMessageResponseEntity> sendMessage({
    required String chatId,
    required DialogMessageRequestEntity message,
  });

  Future<Dialog> fetchServiceDialog();

  StreamController<ChannelStatus> onChannelStatusChange();

  StreamController<ConnectEntity> onConnectStreamStatusChange();

// Future<List<Dialog>> fetchDialogs();
}
