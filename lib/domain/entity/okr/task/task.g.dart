// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Task _$$_TaskFromJson(Map<String, dynamic> json) => _$_Task(
      id: json['id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      assignee: json['assignee'] as String?,
      assigner: json['assigner'] as String?,
      point: json['point'] as int?,
      parrentTask: json['parrentTask'] as String?,
      relatedTask: json['relatedTask'] as String?,
      keyResultId: json['keyResultId'] as String?,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      status: json['status'] as String?,
      priority: json['priority'] as int?,
    );

Map<String, dynamic> _$$_TaskToJson(_$_Task instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'assignee': instance.assignee,
      'assigner': instance.assigner,
      'point': instance.point,
      'parrentTask': instance.parrentTask,
      'relatedTask': instance.relatedTask,
      'keyResultId': instance.keyResultId,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'status': instance.status,
      'priority': instance.priority,
    };
