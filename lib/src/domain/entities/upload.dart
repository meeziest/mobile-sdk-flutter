import 'dart:async';

import 'package:webitel_portal_sdk/src/domain/entities/upload_response.dart';

import 'media_file_response.dart';

/// An abstract interface class representing a file upload operation.
/// This interface provides methods to upload media files and handle the upload progress.
///
abstract interface class Upload {
  /// A stream of [MediaFileResponse] providing updates on the upload progress.
  /// This stream should emit events to notify the caller of the upload progress.
  /// The [MediaFileResponse] object should contain information about the upload status,
  /// such as the current progress, the total size of the file, and any errors that may occur.
  StreamController<UploadResponse> get onProgress;

  /// Cancels the upload operation.
  Future<void> cancel();
}
