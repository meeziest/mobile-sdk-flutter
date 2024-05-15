class PeerInfo {
  final String id;
  final String type;
  final String name;

  PeerInfo({
    required this.id,
    required this.type,
    required this.name,
  });

  // Named constructor for creating an initial/default instance
  PeerInfo.initial()
      : id = 'initial_id',
        type = 'initial_type',
        name = 'initial_name';
}
