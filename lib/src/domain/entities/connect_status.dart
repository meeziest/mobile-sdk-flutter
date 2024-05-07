enum ConnectStatus { initial, opened, closed }

class ConnectStreamStatus {
  final ConnectStatus status;
  final String? errorMessage;

  ConnectStreamStatus({required this.status, this.errorMessage});
}
