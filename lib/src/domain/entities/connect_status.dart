/// Enumeration representing the status of a bi-directional gRPC connection.
enum ConnectStatus {
  /// The initial state of the connection.
  initial,

  /// The state when the connection is opened and active.
  opened,

  /// The state when the connection is closed.
  closed,
}
