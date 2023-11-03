// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tenant_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TenantResponseImpl _$$TenantResponseImplFromJson(Map<String, dynamic> json) =>
    _$TenantResponseImpl(
      tenantName: json['tenantName'] as String?,
      tenantId: json['tenantId'] as String?,
      redirecUrl: json['redirecUrl'] as String?,
      createBy: json['createBy'] as String?,
      createDate: json['createDate'] as String?,
    );

Map<String, dynamic> _$$TenantResponseImplToJson(
        _$TenantResponseImpl instance) =>
    <String, dynamic>{
      'tenantName': instance.tenantName,
      'tenantId': instance.tenantId,
      'redirecUrl': instance.redirecUrl,
      'createBy': instance.createBy,
      'createDate': instance.createDate,
    };
