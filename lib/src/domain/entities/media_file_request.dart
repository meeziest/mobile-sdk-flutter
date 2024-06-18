/// Represents a request to upload or process a media file.
class MediaFileRequest {
  /// The name of the media file.
  final String name;

  /// The type of the media file.
  final String type;

  /// The unique identifier for the request.
  final String requestId;

  /// The data stream of the media file.
  final Stream<List<int>> data;

  /// Constructs a [MediaFileRequest] instance with the given file details and data stream.
  ///
  /// [name] The name of the media file.
  /// [type] The type of the media file.
  /// [requestId] The unique identifier for the request.
  /// [data] The data stream of the media file.
  MediaFileRequest({
    required this.data,
    required this.name,
    required this.type,
    required this.requestId,
  });
}
