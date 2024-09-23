import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:webitel_portal_sdk/src/domain/entities/call_error.dart';
import 'package:webitel_portal_sdk/src/domain/entities/media_file_response.dart';
import 'package:webitel_portal_sdk/src/domain/entities/upload.dart';
import 'package:webitel_portal_sdk/src/domain/entities/upload_response.dart';
import 'package:webitel_portal_sdk/src/domain/services/chat_service.dart';
import 'package:webitel_portal_sdk/src/generated/portal/media.pbgrpc.dart';
import 'package:webitel_portal_sdk/src/injection/injection.dart';

/// Implementation of the [Upload] interface, representing a file upload operation.
@LazySingleton(as: Upload)
final class UploadImpl implements Upload {
  /// The current offset in bytes of the upload.
  int offset;

  /// The subscription for the upload stream.
  StreamSubscription<UploadProgress>? subscription;

  @override
  final StreamController<UploadResponse> onProgress;

  /// An optional error that might have occurred during the upload.
  CallError? _error;

  late final ChatService _chatService;

  /// Constructs an [UploadImpl] with the given media type, name, data stream, and data stream controller.
  ///
  /// [mediaType] is the type of the media being uploaded.
  /// [mediaName] is the name of the media being uploaded.
  /// [mediaData] is the data stream of the media being uploaded.
  /// [onData] is a stream of [MediaFileResponse] providing updates on the upload progress.
  UploadImpl({
    required this.onProgress,
    this.subscription,
    this.offset = 0,
  }) {
    _chatService = getIt.get<ChatService>();
  }

  /// Cancels the upload operation.
  ///
  /// Cancels the current subscription to stop the upload and closes the [onData] stream controller.
  @override
  Future<void> cancel() async {
    if (subscription != null) {
      await subscription!.cancel();
      subscription = null; // Clear the subscription to indicate cancellation
      onProgress
          .close(); // Close the stream controller to signal the end of the upload
    }
  }

  /// Sets an error if an upload error occurs.
  void setError(CallError error) {
    _error = error;
  }

  /// Updates the offset of the upload.
  ///
  /// [newOffset] is the new offset in bytes to update.
  void updateOffset(int newOffset) {
    offset = newOffset;
  }

  /// Sets the subscription for the upload.
  ///
  /// [newSubscription] is the new [StreamSubscription] to set.
  void setSubscription(StreamSubscription<UploadProgress> newSubscription) {
    subscription = newSubscription;
  }
}
