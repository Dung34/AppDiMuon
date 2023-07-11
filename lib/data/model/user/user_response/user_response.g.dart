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
      avatar: json['avatar'] as String?,
      coverImage: json['coverImage'] as String?,
      dob: json['dob'] as String?,
      role: json['role'] as int?,
      createdDate: json['createdDate'] as String?,
      position: json['position'] as String?,
      company: json['company'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      lastModifiedDate: json['lastModifiedDate'] == null
          ? null
          : DateTime.parse(json['lastModifiedDate'] as String),
    );

Map<String, dynamic> _$$_UserResponseToJson(_$_UserResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'fullname': instance.fullname,
      'avatar': instance.avatar,
      'coverImage': instance.coverImage,
      'dob': instance.dob,
      'role': instance.role,
      'createdDate': instance.createdDate,
      'position': instance.position,
      'company': instance.company,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'lastModifiedDate': instance.lastModifiedDate?.toIso8601String(),
    };
