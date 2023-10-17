// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UnitImpl _$$UnitImplFromJson(Map<String, dynamic> json) => _$UnitImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      parrentId: json['parrentId'] as String?,
      description: json['description'] as String?,
      coverImage: json['coverImage'] as String?,
      totalMemberCount: json['totalMemberCount'] as int?,
      subUnit: (json['subUnit'] as List<dynamic>?)
          ?.map((e) => Unit.fromJson(e as Map<String, dynamic>))
          .toList(),
      okRsId: json['okRsId'] as String?,
    );

Map<String, dynamic> _$$UnitImplToJson(_$UnitImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'parrentId': instance.parrentId,
      'description': instance.description,
      'coverImage': instance.coverImage,
      'totalMemberCount': instance.totalMemberCount,
      'subUnit': instance.subUnit,
      'okRsId': instance.okRsId,
    };
