// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnitResponse _$$_UnitResponseFromJson(Map<String, dynamic> json) =>
    _$_UnitResponse(
      name: json['name'] as String?,
      parentId: json['parentId'] as String?,
      description: json['description'] as String?,
      coverImage: json['coverImage'] as String?,
      id: json['id'] as String?,
      createdDate: json['createdDate'] as String?,
      totalMemberCount: json['totalMemberCount'] as int?,
      subUnit: (json['subUnit'] as List<dynamic>?)
          ?.map((e) => Unit.fromJson(e as Map<String, dynamic>))
          .toList(),
      okRsId: json['okRsId'] as String?,
    );

Map<String, dynamic> _$$_UnitResponseToJson(_$_UnitResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'parentId': instance.parentId,
      'description': instance.description,
      'coverImage': instance.coverImage,
      'id': instance.id,
      'createdDate': instance.createdDate,
      'totalMemberCount': instance.totalMemberCount,
      'subUnit': instance.subUnit,
      'okRsId': instance.okRsId,
    };
