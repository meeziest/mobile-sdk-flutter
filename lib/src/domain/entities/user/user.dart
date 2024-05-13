import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class UserEntity {
  final String id;
  final String appToken;
  final String deviceId;
  final String accessToken;

  UserEntity({
    required this.accessToken,
    required this.id,
    required this.appToken,
    required this.deviceId,
  });

  factory UserEntity.initial() {
    return UserEntity(
      accessToken: '',
      id: '',
      appToken: '',
      deviceId: '',
    );
  }

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserEntityToJson(this);
}
