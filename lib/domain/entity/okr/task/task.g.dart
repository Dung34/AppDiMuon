// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskImpl _$$TaskImplFromJson(Map<String, dynamic> json) => _$TaskImpl(
      id: json['id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      assignee: json['assignee'] == null
          ? null
          : UserEntity.fromJson(json['assignee'] as Map<String, dynamic>),
      assigner: json['assigner'] == null
          ? null
          : UserEntity.fromJson(json['assigner'] as Map<String, dynamic>),
      point: json['point'] as int?,
      parrentTask: json['parrentTask'] == null
          ? null
          : Task.fromJson(json['parrentTask'] as Map<String, dynamic>),
      relatedTask: (json['relatedTask'] as List<dynamic>?)
          ?.map((e) => Task.fromJson(e as Map<String, dynamic>))
          .toList(),
      keyResultId: json['keyResultId'] as String?,
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      status: json['status'] as int?,
      statusStr: json['statusStr'] as String?,
      priority: json['priority'] as int?,
      priorityStr: json['priorityStr'] as String?,
    );

Map<String, dynamic> _$$TaskImplToJson(_$TaskImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'assignee': instance.assignee,
      'assigner': instance.assigner,
      'point': instance.point,
      'parrentTask': instance.parrentTask,
      'relatedTask': instance.relatedTask,
      'keyResultId': instance.keyResultId,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'status': instance.status,
      'statusStr': instance.statusStr,
      'priority': instance.priority,
      'priorityStr': instance.priorityStr,
    };
