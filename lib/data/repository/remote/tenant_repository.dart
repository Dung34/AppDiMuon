import '../../../domain/entity/tenant/claim.dart';
import '../../../domain/entity/tenant/tenant.dart';
import '../../model/api/base_response.dart';

abstract class TenantRepository {
  Future<ResponseWrapper<List<Tenant>>> getAllTenantByUserId();

  Future<ResponseWrapper<Claim>> getPositionForUser(String? userId);

  Future<ResponseWrapper<Tenant>> getTenantDetail();
}
