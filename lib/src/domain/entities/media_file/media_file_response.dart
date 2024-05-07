class MediaFileResponseEntity {
  final String name;
  final String type;
  final String id;
  final int size;
  final List<int> bytes;

  MediaFileResponseEntity({
    required this.size,
    required this.bytes,
    required this.name,
    required this.type,
    required this.id,
  });

  MediaFileResponseEntity.initial()
      : name = '',
        type = '',
        id = '',
        size = 0,
        bytes = [];

  MediaFileResponseEntity copyWith({
    String? name,
    String? type,
    String? id,
    int? size,
    List<int>? bytes,
  }) {
    return MediaFileResponseEntity(
      name: name ?? this.name,
      type: type ?? this.type,
      id: id ?? this.id,
      size: size ?? this.size,
      bytes: bytes ?? this.bytes,
    );
  }
}
