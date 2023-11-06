import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../config/config.dart';
import '../../../di/di.dart';
import '../../../domain/entity/tenant/tenant.dart';
import '../../../domain/mapper/tenant_mapper.dart';
import '../../model/api/base_response.dart';
import '../../model/tenant/tenant_response.dart';
import '../interceptor/dio_base_options.dart';
import '../interceptor/interceptor.dart';
import '../local/local_data_access.dart';
import 'tenant_repository.dart';

class TenantRepositoryImplement implements TenantRepository {
  final Dio dio = getIt.get<Dio>();
  final LocalDataAccess localDataAccess = getIt.get<LocalDataAccess>();
  String accessToken = "";
  final AppInterceptor appInterceptor = getIt.get<AppInterceptor>();
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
      final response = await dio.get("/get-all-tenant-by-userID",
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
}
