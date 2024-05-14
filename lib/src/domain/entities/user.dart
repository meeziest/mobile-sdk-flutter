class User {
  final String id;
  final String appToken;
  final String deviceId;
  final String accessToken;

  User({
    required this.accessToken,
    required this.id,
    required this.appToken,
    required this.deviceId,
  });

  factory User.initial() {
    return User(
      accessToken: '',
      id: '',
      appToken: '',
      deviceId: '',
    );
  }
}
