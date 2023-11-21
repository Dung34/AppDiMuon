// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserReponseImpl _$$UserReponseImplFromJson(Map<String, dynamic> json) =>
    _$UserReponseImpl(
      id: json['id'] as String?,
      login: json['login'] as String?,
      referralCode: json['referralCode'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      fullName: json['fullName'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      imageUrl: json['imageUrl'] as String?,
      activated: json['activated'] as bool?,
      langKey: json['langKey'] as String?,
      createdBy: json['createdBy'] as String?,
      createdDate: json['createdDate'] as String?,
      lastModifiedBy: json['lastModifiedBy'] as String?,
      lastModifiedDate: json['lastModifiedDate'] as String?,
      authorities: (json['authorities'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      membershipType: json['membershipType'] as int?,
    );

Map<String, dynamic> _$$UserReponseImplToJson(_$UserReponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'login': instance.login,
      'referralCode': instance.referralCode,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'fullName': instance.fullName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'imageUrl': instance.imageUrl,
      'activated': instance.activated,
      'langKey': instance.langKey,
      'createdBy': instance.createdBy,
      'createdDate': instance.createdDate,
      'lastModifiedBy': instance.lastModifiedBy,
      'lastModifiedDate': instance.lastModifiedDate,
      'authorities': instance.authorities,
      'membershipType': instance.membershipType,
    };
