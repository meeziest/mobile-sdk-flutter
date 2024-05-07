class MediaFileRequestEntity {
  final String name;
  final String type;
  final String requestId;
  final Stream<List<int>> data;

  MediaFileRequestEntity({
    required this.data,
    required this.name,
    required this.type,
    required this.requestId,
  });
}
