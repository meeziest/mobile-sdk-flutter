class User {
  final String id;
  final String appToken;
  final String deviceId;
  final String? accessToken;
  final String? tokenType;
  final String? name;
  final String? sub;
  final String? issuer;
  final int tokenExpiration;

  User({
    this.accessToken,
    this.tokenType,
    this.name,
    this.sub,
    this.issuer,
    required this.tokenExpiration,
    required this.id,
    required this.appToken,
    required this.deviceId,
  });

  factory User.initial() {
    return User(
      name: '',
      sub: '',
      issuer: '',
      tokenType: '',
      tokenExpiration: 0,
      accessToken: '',
      id: '',
      appToken: '',
      deviceId: '',
    );
  }
}
