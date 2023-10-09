// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TaskResponse _$$_TaskResponseFromJson(Map<String, dynamic> json) =>
    _$_TaskResponse(
      taskName: json['taskName'] as String?,
      description: json['description'] as String?,
      dueDate: json['dueDate'] as String?,
      completeDate: json['completeDate'] as String?,
      point: json['point'] as int?,
      assigneeId: json['assigneeId'] as String?,
      assigneerId: json['assigneerId'] as String?,
      type: json['type'] as int?,
      listRelatedTask: (json['listRelatedTask'] as List<dynamic>?)
          ?.map((e) => TaskResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      createByName: json['createByName'] as String?,
      status: json['status'] as int?,
      priority: json['priority'] as int?,
      id: json['id'] as String?,
      createdBy: json['createdBy'] as String?,
      createdDate: json['createdDate'] as String?,
    );

Map<String, dynamic> _$$_TaskResponseToJson(_$_TaskResponse instance) =>
    <String, dynamic>{
      'taskName': instance.taskName,
      'description': instance.description,
      'dueDate': instance.dueDate,
      'completeDate': instance.completeDate,
      'point': instance.point,
      'assigneeId': instance.assigneeId,
      'assigneerId': instance.assigneerId,
      'type': instance.type,
      'listRelatedTask': instance.listRelatedTask,
      'createByName': instance.createByName,
      'status': instance.status,
      'priority': instance.priority,
      'id': instance.id,
      'createdBy': instance.createdBy,
      'createdDate': instance.createdDate,
    };
