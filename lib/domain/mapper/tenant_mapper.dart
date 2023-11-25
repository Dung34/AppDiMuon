import 'package:active_plus/data/mapper/base/base_data_mapper.dart';

import '../../data/model/tenant/tenant_response.dart';
import '../../data/model/tenant/claim_response.dart';
import '../entity/tenant/tenant.dart';
import '../entity/tenant/claim.dart';

class TenatMapper extends BaseDataMapper<TenantResponse, Tenant>
    with DataMapperMixin {
  @override
  TenantResponse mapToData(Tenant entity) {
    return TenantResponse(
      tenantName: entity.tenantName,
      id: entity.tenantId,
      redirecUrl: entity.redirecUrl,
      createBy: entity.createBy,
      createDate: entity.createDate,
    );
  }

  @override
  Tenant mapToEntity(TenantResponse? data) {
    return Tenant(
      tenantName: data?.tenantName,
      tenantId: data?.id,
      redirecUrl: data?.redirecUrl,
      createBy: data?.createBy,
      createDate: data?.createDate,
    );
  }
}

class ClaimMapper extends BaseDataMapper<ClaimResponse, Claim>
    with DataMapperMixin {
  @override
  Claim mapToEntity(ClaimResponse? data) {
    return Claim(
        createdBy: data?.createdBy,
        createdDate: data?.createdDate,
        department: data?.department,
        description: data?.description,
        id: data?.id,
        name: data?.name,
        tenantId: data?.tenantId);
  }

  @override
  ClaimResponse mapToData(Claim entity) {
    return ClaimResponse(
        createdBy: entity.createdBy,
        createdDate: entity.createdDate,
        department: entity.department,
        description: entity.description,
        id: entity.id,
        name: entity.name,
        tenantId: entity.tenantId);
  }
}
