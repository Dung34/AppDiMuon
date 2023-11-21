import 'package:active_plus/data/mapper/base/base_data_mapper.dart';

import '../../data/model/tenant/tenant_response.dart';
import '../entity/tenant/tenant.dart';

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
