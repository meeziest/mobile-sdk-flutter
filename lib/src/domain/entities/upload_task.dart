import 'dart:async';
import 'dart:io';

import 'package:webitel_portal_sdk/src/domain/entities/upload_response.dart';

class UploadTask {
  final String mediaType;
  final String mediaName;
  final File file;
  final String? pid;
  final int? offset;
  final StreamController<UploadResponse> controller;
  Completer<void> completer;

  UploadTask({
    required this.mediaType,
    required this.mediaName,
    required this.file,
    this.pid,
    this.offset,
    required this.controller,
    required this.completer,
  });
}
