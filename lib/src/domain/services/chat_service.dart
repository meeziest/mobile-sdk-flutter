import 'dart:async';
import 'dart:io';

import 'package:webitel_portal_sdk/src/data/download_impl.dart';
import 'package:webitel_portal_sdk/src/domain/entities/call_error.dart';
import 'package:webitel_portal_sdk/src/domain/entities/channel.dart';
import 'package:webitel_portal_sdk/src/domain/entities/channel_status.dart';
import 'package:webitel_portal_sdk/src/domain/entities/connect.dart';
import 'package:webitel_portal_sdk/src/domain/entities/dialog.dart';
import 'package:webitel_portal_sdk/src/domain/entities/dialog_message_request.dart';
import 'package:webitel_portal_sdk/src/domain/entities/dialog_message_response.dart';
import 'package:webitel_portal_sdk/src/domain/entities/download.dart';
import 'package:webitel_portal_sdk/src/domain/entities/media_file_response.dart';
import 'package:webitel_portal_sdk/src/domain/entities/postback.dart';

import '../entities/upload.dart';

/// Interface for the chat service, providing methods for fetching messages,
/// sending messages, handling dialogs, and managing streams and errors.
abstract interface class ChatService {
  /// Fetches messages from a chat.
  ///
  /// [chatId] The ID of the chat to fetch messages from.
  /// [limit] The maximum number of messages to fetch (optional).
  /// [offset] The offset from which to start fetching messages (optional).
  ///
  /// Returns a list of [DialogMessageResponse] representing the fetched messages.
  Future<List<DialogMessageResponse>> fetchMessages({
    required String chatId,
    int? limit,
    int? offset,
  });

  /// Fetches updates from a chat.
  ///
  /// [chatId] The ID of the chat to fetch updates from.
  /// [limit] The maximum number of updates to fetch (optional).
  /// [offset] The offset from which to start fetching updates (optional).
  ///
  /// Returns a list of [DialogMessageResponse] representing the fetched updates.
  Future<List<DialogMessageResponse>> fetchUpdates({
    required String chatId,
    int? limit,
    int? offset,
  });

  /// Sends a message in a chat.
  ///
  /// [chatId] The ID of the chat to send the message to.
  /// [message] The message to be sent.
  ///
  /// Returns a [DialogMessageResponse] indicating the result of the send operation.
  Future<DialogMessageResponse> sendMessage({
    required String chatId,
    required DialogMessageRequest message,
    int? timeout,
  });

  /// Sends a postback message in a chat.
  ///
  /// [chatId] The ID of the chat to send the postback to.
  /// [postback] The postback to be sent.
  /// [requestId] The [postback] id to be sent.
  ///
  /// Returns a [DialogMessageResponse] indicating the result of the send operation.
  Future<DialogMessageResponse> sendPostback({
    required String chatId,
    required Postback postback,
    required String requestId,
    int? timeout,
  });

  /// Fetches the service dialog.
  ///
  /// Returns a [Dialog] representing the service dialog.
  Future<Dialog> fetchServiceDialog();

  /// Fetches all dialogs.
  ///
  /// Returns a list of [Dialog] representing all dialogs.
  Future<List<Dialog>> fetchDialogs();

  /// Attempts to reconnect to the stream.
  ///
  /// Returns a [Future] that completes when the reconnection attempt is done.
  Future<void> reconnectToStream();

  /// Retrieves the current communication channel.
  ///
  /// Returns a [Channel] representing the current communication channel.
  Future<Channel> getChannel();

  /// Downloads a media file associated with a dialog.
  ///
  /// [fileId] The unique identifier of the file to be downloaded.
  ///
  /// Returns a stream of [MediaFileResponse] for the downloaded file.
  Download downloadFile({
    required String fileId,
    required String savePath,
    int? offset,
  });

  /// Resumes the download of a media file.
  ///
  /// [fileId] The ID of the file to be resumed.
  Future<void> resumeDownload({
    required String fileId,
    required StreamController<MediaFileResponse> controller,
    required int offset,
    required DownloadImpl download,
  });

  /// Uploads a media file to be sent in a dialog.
  ///
  /// [mediaType] The type of the media to be uploaded.
  /// [mediaName] The name of the media to be uploaded.
  /// [mediaData] The data stream of the media to be uploaded.
  ///
  /// Returns an [Upload] object representing the upload operation.
  Upload uploadFile({
    required String mediaType,
    required String mediaName,
    required File file,
    String? pid,
    int? offset,
  });

  /// Provides a stream controller for channel status changes.
  ///
  /// Returns a [StreamController] for [ChannelStatus] changes.
  StreamController<ChannelStatus> onChannelStatusChange();

  /// Provides a stream controller for connection status changes.
  ///
  /// Returns a [StreamController] for [Connect] status changes.
  StreamController<Connect> onConnectStreamStatusChange();

  /// Provides a stream controller for errors occurring in the chat service.
  ///
  /// Returns a [StreamController] for [CallError] occurrences.
  StreamController<CallError> onError();

  /// Sends a ping request to the server to check connectivity.
  ///
  /// Returns a [Future] that completes with the ping response.
  Future<String> ping();
}
