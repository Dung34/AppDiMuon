// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UnitResponseImpl _$$UnitResponseImplFromJson(Map<String, dynamic> json) =>
    _$UnitResponseImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      parentId: json['parentId'] as String?,
      description: json['description'] as String?,
      coverImage: json['coverImage'] as String?,
      totalMemberCount: json['totalMemberCount'] as int?,
      subUnit: (json['subUnit'] as List<dynamic>?)
          ?.map((e) => Unit.fromJson(e as Map<String, dynamic>))
          .toList(),
      okRsId: json['okRsId'] as String?,
      tenantId: json['tenantId'] as String?,
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      totalTask: json['totalTask'] as int?,
      taskDone: json['taskDone'] as int?,
      owner: json['owner'] as String?,
      createdBy: json['createdBy'] as String?,
      createdDate: json['createdDate'] as String?,
    );

Map<String, dynamic> _$$UnitResponseImplToJson(_$UnitResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'parentId': instance.parentId,
      'description': instance.description,
      'coverImage': instance.coverImage,
      'totalMemberCount': instance.totalMemberCount,
      'subUnit': instance.subUnit,
      'okRsId': instance.okRsId,
      'tenantId': instance.tenantId,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'totalTask': instance.totalTask,
      'taskDone': instance.taskDone,
      'owner': instance.owner,
      'createdBy': instance.createdBy,
      'createdDate': instance.createdDate,
    };
