import 'dart:async';

import 'package:webitel_portal_sdk/src/domain/entities/channel.dart';
import 'package:webitel_portal_sdk/src/domain/entities/channel_status.dart';
import 'package:webitel_portal_sdk/src/domain/entities/connect.dart';
import 'package:webitel_portal_sdk/src/domain/entities/dialog.dart';
import 'package:webitel_portal_sdk/src/domain/entities/dialog_message/dialog_message_request.dart';
import 'package:webitel_portal_sdk/src/domain/entities/dialog_message/dialog_message_response.dart';
import 'package:webitel_portal_sdk/src/domain/entities/error.dart';
import 'package:webitel_portal_sdk/src/domain/entities/media_file/media_file_response.dart';

abstract interface class ChatService {
  Future<List<DialogMessageResponse>> fetchMessages({
    required String chatId,
    int? limit,
    int? offset,
  });

  Future<List<DialogMessageResponse>> fetchUpdates({
    required String chatId,
    int? limit,
    int? offset,
  });

  Future<DialogMessageResponse> sendMessage({
    required String chatId,
    required DialogMessageRequest message,
  });

  Future<Dialog> fetchServiceDialog();

  Future<List<Dialog>> fetchDialogs();

  Future<void> reconnectToStream();

  Future<Channel> getChannel();

  StreamController<MediaFileResponse> downloadFile({required String fileId});

  StreamController<ChannelStatus> onChannelStatusChange();

  StreamController<Connect> onConnectStreamStatusChange();

  StreamController<Error> onError();
}
