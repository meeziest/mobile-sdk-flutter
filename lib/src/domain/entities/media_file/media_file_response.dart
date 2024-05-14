class MediaFileResponse {
  final String name;
  final String type;
  final String id;
  final int size;
  final List<int> bytes;

  MediaFileResponse({
    required this.size,
    required this.bytes,
    required this.name,
    required this.type,
    required this.id,
  });

  MediaFileResponse.initial()
      : name = '',
        type = '',
        id = '',
        size = 0,
        bytes = [];

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
