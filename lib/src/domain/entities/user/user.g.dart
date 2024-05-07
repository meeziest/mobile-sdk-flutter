// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) => UserEntity(
      accessToken: json['accessToken'] as String,
      id: json['id'] as String,
      clientToken: json['clientToken'] as String,
      deviceId: json['deviceId'] as String,
    );

Map<String, dynamic> _$UserEntityToJson(UserEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'clientToken': instance.clientToken,
      'deviceId': instance.deviceId,
      'accessToken': instance.accessToken,
    };
