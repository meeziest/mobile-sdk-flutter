import 'dart:async';

import 'package:webitel_portal_sdk/src/domain/entities/channel_status.dart';
import 'package:webitel_portal_sdk/src/domain/entities/connect.dart';
import 'package:webitel_portal_sdk/src/domain/entities/dialog.dart';
import 'package:webitel_portal_sdk/src/domain/entities/dialog_message/dialog_message_request.dart';
import 'package:webitel_portal_sdk/src/domain/entities/dialog_message/dialog_message_response.dart';
import 'package:webitel_portal_sdk/src/domain/entities/error.dart';

abstract interface class ChatService {
  Future<List<DialogMessageResponseEntity>> fetchMessages({
    required String chatId,
    int? limit,
    int? offset,
  });

  Future<List<DialogMessageResponseEntity>> fetchUpdates({
    required String chatId,
    int? limit,
    int? offset,
  });

  Future<DialogMessageResponseEntity> sendMessage({
    required String chatId,
    required DialogMessageRequestEntity message,
  });

  Future<Dialog> fetchServiceDialog();

  Future<List<Dialog>> fetchDialogs();

  StreamController<ChannelStatus> onChannelStatusChange();

  StreamController<ConnectEntity> onConnectStreamStatusChange();

  StreamController<ErrorEntity> onError();
}
