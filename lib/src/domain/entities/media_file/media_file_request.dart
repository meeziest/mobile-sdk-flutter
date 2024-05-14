class MediaFileRequest {
  final String name;
  final String type;
  final String requestId;
  final Stream<List<int>> data;

  MediaFileRequest({
    required this.data,
    required this.name,
    required this.type,
    required this.requestId,
  });
}
