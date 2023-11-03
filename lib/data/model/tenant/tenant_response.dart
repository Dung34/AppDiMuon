import 'package:freezed_annotation/freezed_annotation.dart';

part 'tenant_response.g.dart';
part 'tenant_response.freezed.dart';

@unfreezed
class TenantResponse with _$TenantResponse {
  factory TenantResponse({
    String? tenantName,
    String? tenantId,
    String? redirecUrl,
    String? createBy,
    String? createDate,
  }) = _TenantResponse;
  factory TenantResponse.fromJson(Map<String, dynamic> json) =>
      _$TenantResponseFromJson(json);
}
