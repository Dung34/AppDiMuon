import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../config/config.dart';
import '../../../di/di.dart';
import '../../../domain/entity/tenant/claim.dart';
import '../../../domain/entity/tenant/tenant.dart';
import '../../../domain/mapper/tenant_mapper.dart';
import '../../exceptions/handle_exception.dart';
import '../../model/api/base_response.dart';
import '../../model/tenant/claim_response.dart';
import '../../model/tenant/tenant_response.dart';
import '../interceptor/dio_base_options.dart';
import '../interceptor/interceptor.dart';
import '../local/local_data_access.dart';
import 'tenant_repository.dart';

class TenantRepositoryImplement implements TenantRepository {
  final Dio dio = getIt.get<Dio>();
  final LocalDataAccess localDataAccess = getIt.get<LocalDataAccess>();
  String accessToken = "";
  String tenantId = "";
  final AppInterceptor appInterceptor = getIt.get<AppInterceptor>();
  final ClaimMapper _claimDataMapper = getIt.get<ClaimMapper>();
  final TenatMapper _tenatMapper = getIt.get<TenatMapper>();

  TenantRepositoryImplement() {
    dio.interceptors.add(PrettyDioLogger(
      responseBody: true,
      requestBody: true,
      requestHeader: true,
      responseHeader: true,
    ));
    dio.interceptors.add(appInterceptor.queueInterceptor(dio: dio));
    dio.options =
        DioBaseOptions(baseUrl: Environment.resourcesBaseUrl).baseOption;
  }

  @override
  Future<ResponseWrapper<List<Tenant>>> getAllTenantByUserId() async {
    accessToken = await localDataAccess.getAccessToken();
    final userId = localDataAccess.getUserId();
    try {
      final response = await dio.get(EndPoints.getAllTenant,
          queryParameters: {"UserId": userId},
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));
      if (response.statusCode == 200) {
        return ResponseWrapper.success(
            data: List.from((response.data as List).map(
                (e) => _tenatMapper.mapToEntity(TenantResponse.fromJson(e)))));
      } else {
        return ResponseWrapper.error(message: "");
      }
    } catch (e) {
      return ResponseWrapper.error(message: "");
    }
  }

  @override
  Future<ResponseWrapper<Claim>> getPositionForUser(String? userId) async {
    accessToken = await localDataAccess.getAccessToken();
    tenantId = await localDataAccess.getTenantId();

    try {
      final response = await dio.get(EndPoints.getPositionForUser,
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
          queryParameters: {'UserId': userId, 'TenantId': tenantId});

      if (response.statusCode == 200) {
        return ResponseWrapper.success(
            data: _claimDataMapper
                .mapToEntity(ClaimResponse.fromJson(response.data)));
      }
      return ResponseWrapper.error(message: "");
    } catch (e) {
      handleException(e);
      return ResponseWrapper.error(message: "");
    }
  }

  @override
  Future<ResponseWrapper<Tenant>> getTenantDetail() async {
    accessToken = await localDataAccess.getAccessToken();
    final tenantId = localDataAccess.getTenantId();

    try {
      final response = await dio.get(EndPoints.getTenantDetail,
          queryParameters: {"TenantId": tenantId},
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));

      if (response.statusCode == 200) {
        return ResponseWrapper.success(
            data: _tenatMapper
                .mapToEntity(TenantResponse.fromJson(response.data)));
      }
      return ResponseWrapper.error(message: "");
    } catch (e) {
      return ResponseWrapper.error(message: "");
    }
  }
}
