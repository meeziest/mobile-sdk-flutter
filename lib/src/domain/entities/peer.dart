/// Represents information about a peer in a communication system.
class PeerInfo {
  /// The unique identifier of the peer.
  final String id;

  /// The type of the peer.
  final String type;

  /// The name of the peer.
  final String name;

  /// Constructs a [PeerInfo] instance with the given id, type, and name.
  ///
  /// [id] The unique identifier of the peer.
  /// [type] The type of the peer.
  /// [name] The name of the peer.
  PeerInfo({
    required this.id,
    required this.type,
    required this.name,
  });

  /// Named constructor for creating an initial/default instance of [PeerInfo].
  ///
  /// The initial instance has default values for id, type, and name.
  PeerInfo.initial()
      : id = 'initial_id',
        type = 'initial_type',
        name = 'initial_name';
}
