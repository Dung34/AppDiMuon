import 'dart:developer';

import 'package:active_plus/di/di.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../config/config.dart';
import '../../../domain/entity/target/list_target.dart';
import '../../../domain/entity/target/target.dart';
import '../../../domain/mapper/target_data_mapper.dart';
import '../../model/api/base_response.dart';
import '../../model/target/list_target_response.dart';
import '../interceptor/dio_base_options.dart';
import '../interceptor/interceptor.dart';
import '../local/local_data_access.dart';
import 'target_repository.dart';

class TargetRepositoryImplement implements TargetRepository {
  final Dio dio = getIt.get();
  final LocalDataAccess localDataAccess = getIt.get<LocalDataAccess>();
  String accessToken = "";
  final AppInterceptor appInterceptor = getIt.get<AppInterceptor>();
  final TargetDataMapper _targetDataMapper = getIt.get<TargetDataMapper>();
  final ListTargetMapper _listTargetMapper = getIt.get<ListTargetMapper>();
  TargetRepositoryImplement() {
    dio.interceptors.add(PrettyDioLogger(
        requestBody: true, responseBody: true, requestHeader: true));
    dio.interceptors.add(appInterceptor.queueInterceptor(dio: dio));
    dio.options =
        DioBaseOptions(baseUrl: Environment.resourcesBaseUrl).baseOption;
  }

  @override
  Future<ResponseWrapper<List<Target>>> getAllTarget() async {
    accessToken = await localDataAccess.getAccessToken();
    final String userId = localDataAccess.getUserId();
    try {
      final response = await dio.get(EndPoints.getAllTarget,
          queryParameters: {"UserId": userId, "Page": 1, "PageSize": 10},
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));
      if (response.statusCode == 200) {
        log("oke");
        return ResponseWrapper.success(
            data: _listTargetMapper
                    .mapToEntity(ListTargetResponse.fromJson(response.data))
                    .data ??
                []);
      } else {
        log('failed1');
        return ResponseWrapper.error(message: "");
      }
    } catch (e) {
      log('failed2 ' + e.toString());
      return ResponseWrapper.error(message: "");
    }
  }
}
