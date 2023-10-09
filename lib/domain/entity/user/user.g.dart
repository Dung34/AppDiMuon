// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserEntity _$$_UserEntityFromJson(Map<String, dynamic> json) =>
    _$_UserEntity(
      id: json['id'] as String?,
      login: json['login'] as String?,
      fullName: json['fullName'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      avatar: json['avatar'] as String?,
      coverImage: json['coverImage'] as String?,
      activated: json['activated'] as bool?,
      rank: json['rank'] as int?,
      role: json['role'] as int?,
      membershipType: json['membershipType'] as int?,
    );

Map<String, dynamic> _$$_UserEntityToJson(_$_UserEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'login': instance.login,
      'fullName': instance.fullName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'avatar': instance.avatar,
      'coverImage': instance.coverImage,
      'activated': instance.activated,
      'rank': instance.rank,
      'role': instance.role,
      'membershipType': instance.membershipType,
    };
