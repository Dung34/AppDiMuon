import 'package:freezed_annotation/freezed_annotation.dart';

part 'tenant.g.dart';
part 'tenant.freezed.dart';

@unfreezed
class Tenant with _$Tenant {
  factory Tenant({
    String? tenantName,
    String? redirecUrl,
    String? tenantId,
    String? createBy,
    String? createDate,
  }) = _Tenant;
  factory Tenant.fromJson(Map<String, dynamic> json) => _$TenantFromJson(json);
}
