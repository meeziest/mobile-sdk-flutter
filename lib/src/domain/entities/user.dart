class User {
  final String id;
  final String? name;
  final String? sub;
  final String? issuer;
  final int tokenExpiration; //TODO ADD FIELDS PHONE NUMBER...

  User({
    this.name,
    this.sub,
    this.issuer,
    required this.tokenExpiration,
    required this.id,
  });

  factory User.initial() {
    return User(
      name: '',
      sub: '',
      issuer: '',
      tokenExpiration: 0,
      id: '',
    );
  }
}
