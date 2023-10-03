import '../interceptor/interceptor.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../config/config.dart';
import '../../../di/di.dart';
import '../../../domain/entity/target/target.dart';
import '../../../domain/mapper/target_data_mapper.dart';
import '../../model/api/base_response.dart';
import '../../model/target/list_target_response.dart';
import '../../model/target/target_response.dart';
import '../interceptor/dio_base_options.dart';
import '../local/local_data_access.dart';
import 'target_repository.dart';

class TargetRepositoryImplement implements TargetRepository {
  final Dio dio = getIt.get<Dio>();
  final LocalDataAccess localDataAccess = getIt.get<LocalDataAccess>();
  String accessToken = "";
  String userId = "";
  final AppInterceptor appInterceptor = getIt.get<AppInterceptor>();
  final TargetDataMapper _targetDataMapper = getIt.get<TargetDataMapper>();
  final ListTargetMapper _listTargetMapper = getIt.get<ListTargetMapper>();

  TargetRepositoryImplement() {
    dio.interceptors.add(PrettyDioLogger(
      responseBody: true,
      requestBody: true,
      requestHeader: true,
    ));
    dio.interceptors.add(appInterceptor.queueInterceptor(dio: dio));
    dio.options =
        DioBaseOptions(baseUrl: Environment.resourcesBaseUrl).baseOption;
  }

  @override
  Future<ResponseWrapper<List<Target>>> getAllTarget() async {
    accessToken = await localDataAccess.getAccessToken();
    userId = localDataAccess.getUserId();
    try {
      final response = await dio.get(EndPoints.getAllTarget,
          queryParameters: {"UserId": userId, "Page": 1, "PageSize": 10},
          options: Options(headers: {"Authorization": "Bearer $accessToken"}));
      if (response.statusCode == 200) {
        return ResponseWrapper.success(
            data: _listTargetMapper
                    .mapToEntity(ListTargetResponse.fromJson(response.data))
                    .data ??
                []);
      } else {
        return ResponseWrapper.error(message: "");
      }
    } catch (e) {
      return ResponseWrapper.error(message: "");
    }
  }

  @override
  Future<ResponseWrapper<Target>> getDeteilTarget(String id) async {
    accessToken = await localDataAccess.getAccessToken();
    userId = localDataAccess.getUserId();
    try {
      final response = await dio.get(EndPoints.getDetailTarget,
          queryParameters: {"Id": id, "UserId": userId},
          options: Options(headers: {"Authorization": "Bearer $accessToken"}));
      if (response.statusCode == 200) {
        return ResponseWrapper.success(
            data: _targetDataMapper
                .mapToEntity(TargetResponse.fromJson(response.data)));
      } else {
        return ResponseWrapper.error(message: "");
      }
    } catch (e) {
      return ResponseWrapper.error(message: "");
    }
  }

  @override
  Future<ResponseWrapper<Target>> createTarget(Target target) async {
    accessToken = await localDataAccess.getAccessToken();
    try {
      final response = await dio.post(EndPoints.updateTarget,
          data: _targetDataMapper.mapToData(target).toJson()
            ..removeWhere((key, value) => value == null),
          options: Options(headers: {"Authorization": "Bearer $accessToken"}));
      if (response.statusCode == 200) {
        return ResponseWrapper.success(
            data: _targetDataMapper
                .mapToEntity(TargetResponse.fromJson(response.data)));
      } else {
        return ResponseWrapper.error(message: "");
      }
    } catch (e) {
      return ResponseWrapper.error(message: "");
    }
  }

  @override
  Future<ResponseWrapper<Target>> updateTarget(Target target) async {
    accessToken = await localDataAccess.getAccessToken();
    try {
      final response = await dio.post(EndPoints.updateTarget,
          data: _targetDataMapper.mapToData(target).toJson()
            ..removeWhere((key, value) => value == null),
          options: Options(headers: {"Authorization": "Bearer $accessToken"}));
      if (response.statusCode == 200) {
        return ResponseWrapper.success(
            data: _targetDataMapper
                .mapToEntity(TargetResponse.fromJson(response.data)));
      } else {
        return ResponseWrapper.error(message: "");
      }
    } catch (e) {
      return ResponseWrapper.error(message: "");
    }
  }

  @override
  Future<ResponseWrapper<void>> deleteTarget(String id) async {
    accessToken = await localDataAccess.getAccessToken();
    try {
      final response = await dio.delete(EndPoints.deleteTarget,
          data: id,
          options: Options(headers: {"Authorization": "Bearer $accessToken"}));
      if (response.statusCode == 200) {
        return ResponseWrapper.success(data: null);
      } else {
        return ResponseWrapper.error(message: "");
      }
    } catch (e) {
      return ResponseWrapper.error(message: "");
    }
  }
}
