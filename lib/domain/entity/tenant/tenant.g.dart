// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tenant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TenantImpl _$$TenantImplFromJson(Map<String, dynamic> json) => _$TenantImpl(
      tenantName: json['tenantName'] as String?,
      redirecUrl: json['redirecUrl'] as String?,
      tenantId: json['tenantId'] as String?,
      createBy: json['createBy'] as String?,
      createDate: json['createDate'] as String?,
    );

Map<String, dynamic> _$$TenantImplToJson(_$TenantImpl instance) =>
    <String, dynamic>{
      'tenantName': instance.tenantName,
      'redirecUrl': instance.redirecUrl,
      'tenantId': instance.tenantId,
      'createBy': instance.createBy,
      'createDate': instance.createDate,
    };
