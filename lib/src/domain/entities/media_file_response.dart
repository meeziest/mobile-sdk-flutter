/// Represents a response containing information about a media file.
class MediaFileResponse {
  /// The name of the media file.
  final String name;

  /// The type of the media file.
  final String type;

  /// The unique identifier of the media file.
  final String id;

  /// The size of the media file in bytes.
  final int size;

  /// The byte data of the media file.
  final List<int> bytes;

  /// Constructs a [MediaFileResponse] instance with the given file details.
  ///
  /// [name] The name of the media file.
  /// [type] The type of the media file.
  /// [id] The unique identifier of the media file.
  /// [size] The size of the media file in bytes.
  /// [bytes] The byte data of the media file (optional).
  MediaFileResponse({
    List<int>? bytes,
    required this.size,
    required this.name,
    required this.type,
    required this.id,
  }) : bytes = bytes ?? [];

  /// Named constructor for creating an initial/default instance of [MediaFileResponse].
  ///
  /// The initial instance has default values for all fields.
  MediaFileResponse.initial()
      : name = '',
        type = '',
        id = '',
        size = 0,
        bytes = [];

  /// Creates a copy of this [MediaFileResponse] with the given fields replaced with new values.
  ///
  /// [name] The new name of the media file (optional).
  /// [type] The new type of the media file (optional).
  /// [id] The new unique identifier of the media file (optional).
  /// [size] The new size of the media file in bytes (optional).
  /// [bytes] The new byte data of the media file (optional).
  ///
  /// Returns a new [MediaFileResponse] instance with the updated values.
  MediaFileResponse copyWith({
    String? name,
    String? type,
    String? id,
    int? size,
    List<int>? bytes,
  }) {
    return MediaFileResponse(
      name: name ?? this.name,
      type: type ?? this.type,
      id: id ?? this.id,
      size: size ?? this.size,
      bytes: bytes ?? this.bytes,
    );
  }
}
