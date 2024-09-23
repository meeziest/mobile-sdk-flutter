import 'package:webitel_portal_sdk/src/domain/entities/progress.dart';

/// Represents a response containing information about an uploaded response.
class UploadResponse {
  /// The name of the media file.
  final String? name;

  /// The type of the media file.
  final String? type;

  /// The unique identifier of the media file.
  final String? id;

  /// The size of the media file in bytes.
  final int? size;

  /// The byte data of the media file.
  final Progress? progress;

  /// Constructs a [MediaFileResponse] instance with the given file details.
  ///
  /// [name] The name of the media file.
  /// [type] The type of the media file.
  /// [id] The unique identifier of the media file.
  /// [size] The size of the media file in bytes.
  /// [bytes] The byte data of the media file (optional).
  UploadResponse({
    Progress? progress,
    this.size,
    this.name,
    this.type,
    this.id,
  }) : progress = progress ?? Progress(progressSize: 0, progressId: '');

  /// Named constructor for creating an initial/default instance of [MediaFileResponse].
  ///
  /// The initial instance has default values for all fields.
  UploadResponse.initial()
      : name = '',
        type = '',
        id = '',
        size = 0,
        progress = Progress(progressSize: 0, progressId: '');

  /// Creates a copy of this [MediaFileResponse] with the given fields replaced with new values.
  ///
  /// [name] The new name of the media file (optional).
  /// [type] The new type of the media file (optional).
  /// [id] The new unique identifier of the media file (optional).
  /// [size] The new size of the media file in bytes (optional).
  /// [bytes] The new byte data of the media file (optional).
  ///
  /// Returns a new [MediaFileResponse] instance with the updated values.
  UploadResponse copyWith({
    String? name,
    String? type,
    String? id,
    int? size,
    Progress? progress,
  }) {
    return UploadResponse(
      name: name ?? this.name,
      type: type ?? this.type,
      id: id ?? this.id,
      size: size ?? this.size,
      progress: progress ?? this.progress,
    );
  }
}
