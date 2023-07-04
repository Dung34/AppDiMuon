// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserResponse _$$_UserResponseFromJson(Map<String, dynamic> json) =>
    _$_UserResponse(
      id: json['id'] as String?,
      username: json['username'] as String?,
      fullname: json['fullname'] as String?,
      address: json['address'] as String?,
      major: json['major'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      avatar: json['avatar'] as String?,
      company: json['company'] as String?,
      dob: json['dob'] as String?,
      type: json['type'] as String?,
      error: json['error'],
    );

Map<String, dynamic> _$$_UserResponseToJson(_$_UserResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'fullname': instance.fullname,
      'address': instance.address,
      'major': instance.major,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'avatar': instance.avatar,
      'company': instance.company,
      'dob': instance.dob,
      'type': instance.type,
      'error': instance.error,
    };
