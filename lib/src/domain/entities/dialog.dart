import 'dart:async';
import 'dart:io';

import 'package:webitel_portal_sdk/src/domain/entities/call_error.dart';
import 'package:webitel_portal_sdk/src/domain/entities/dialog_message_response.dart';
import 'package:webitel_portal_sdk/src/domain/entities/download.dart';
import 'package:webitel_portal_sdk/src/domain/entities/portal_chat_member.dart';
import 'package:webitel_portal_sdk/src/domain/entities/postback.dart';
import 'package:webitel_portal_sdk/src/domain/entities/upload.dart';
import 'package:webitel_portal_sdk/src/domain/entities/upload_file.dart';

/// Interface for dialog operations, providing methods to manage messages,
/// download files, and handle dialog events.
abstract interface class Dialog {
  /// Retrieves the last occurred error, if any.
  ///
  /// Returns a [CallError] if an error occurred, otherwise returns null.
  CallError? get error;

  /// Retrieves the unique identifier of the dialog.
  ///
  /// Returns the dialog ID as a string.
  String get id;

  /// Retrieves the content of the top message in the dialog.
  ///
  /// Returns the top message as a string.
  String get topMessage;

  /// Retrieves the current status of the dialog whether it's closed.
  ///
  bool get isClosed;

  /// Stream of new messages in the dialog.
  ///
  /// Returns a stream of [DialogMessageResponse] for new messages.
  Stream<DialogMessageResponse> get onNewMessage;

  /// Stream of chat member added.
  ///
  /// Returns a stream of [ChatMember] for new member added.
  Stream<PortalChatMember> get onMemberAdded;

  /// Stream of chat member left.
  ///
  /// Returns a stream of [ChatMember] for member left.
  Stream<PortalChatMember> get onMemberLeft;

  /// Downloads a media file associated with the dialog.
  ///
  /// [fileId] The unique identifier of the file to be downloaded.
  ///
  /// Returns a [Download] object representing the download operation.
  Download downloadFile({
    required String fileId,
    required String savePath,
    int? offset,
  });

  /// Uploads a media file to be sent in the dialog.
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

  /// Sends a message in the dialog.
  ///
  /// [mediaType] The type of the media to be sent (optional).
  /// [mediaName] The name of the media to be sent (optional).
  /// [mediaData] The data stream of the media to be sent (optional).
  /// [content] The content of the message.
  /// [requestId] The unique identifier for the message request.
  ///
  /// Returns a [DialogMessageResponse] indicating the result of the send operation.
  Future<DialogMessageResponse> sendMessage({
    UploadFile? uploadFile,
    required String content,
    required String requestId,
    int? timeout,
  });

  /// Sends a postback.
  ///
  /// [postback] The postback object.
  /// [requestId] The unique identifier for the message request.
  ///
  /// Returns a [DialogMessageResponse] indicating the result of the send operation.
  Future<DialogMessageResponse> sendPostback({
    required Postback postback,
    required String requestId,
    int? timeout,
  });

  /// Fetches messages in the dialog with optional pagination.
  ///
  /// [limit] The maximum number of messages to fetch (optional).
  /// [offset] The offset from which to start fetching messages (optional).
  ///
  /// Returns a list of [DialogMessageResponse] representing the fetched messages.
  Future<List<DialogMessageResponse>> fetchMessages({
    int? limit,
    int? offset,
  });

  /// Fetches updates in the dialog with optional pagination.
  ///
  /// [limit] The maximum number of updates to fetch (optional).
  /// [offset] The offset from which to start fetching updates (optional).
  ///
  /// Returns a list of [DialogMessageResponse] representing the fetched updates.
  Future<List<DialogMessageResponse>> fetchUpdates({
    int? limit,
    int? offset,
  });
}
