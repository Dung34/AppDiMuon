// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'claim.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClaimImpl _$$ClaimImplFromJson(Map<String, dynamic> json) => _$ClaimImpl(
      name: json['name'] as String?,
      description: json['description'] as String?,
      department: json['department'] as String?,
      tenantId: json['tenantId'] as String?,
      id: json['id'] as String?,
      createdBy: json['createdBy'] as String?,
      createdDate: json['createdDate'] as String?,
    );

Map<String, dynamic> _$$ClaimImplToJson(_$ClaimImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'department': instance.department,
      'tenantId': instance.tenantId,
      'id': instance.id,
      'createdBy': instance.createdBy,
      'createdDate': instance.createdDate,
    };
