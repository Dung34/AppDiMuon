import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../config/config.dart';
import '../../../di/di.dart';
import '../../../domain/entity/report/report_daily.dart';
import '../../../domain/mapper/list_report_data_mapper.dart';
import '../../../domain/mapper/report_data_mapper.dart';
import '../../exceptions/handle_exception.dart';
import '../../model/api/base_response.dart';
import '../../model/report_response/list_report_response.dart';
import '../../model/report_response/report_response.dart';
import '../interceptor/dio_base_options.dart';
import '../interceptor/interceptor.dart';
import '../local/local_data_access.dart';
import 'report_repository.dart';

class ReportRepositoryImplement implements ReportRepository {
  final Dio dio = getIt.get<Dio>();
  final LocalDataAccess localDataAccess = getIt.get<LocalDataAccess>();
  String accessToken = '';
  final ReportDataMapper _reportDataMapper = getIt.get<ReportDataMapper>();
  final ListReportDataMapper _listReportDataMapper =
      getIt.get<ListReportDataMapper>();
  final AppInterceptor appInterceptor = getIt.get<AppInterceptor>();
  ReportRepositoryImplement() {
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
  Future<ResponseWrapper<List<ReportDaily>>> getAllReport(String userId) async {
    accessToken = await localDataAccess.getAccessToken();
    try {
      final response = await dio.get('/reportDaily/view-all-by-UserId',
          queryParameters: {"Id": userId, "Page": 1, "PageSize": 5},
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));
      if (response.statusCode == 200) {
        return ResponseWrapper.success(
            data: _listReportDataMapper
                    .mapToEntity(
                      ReportResponse.fromJson(response.data)
                          as ListReportResponse?,
                    )
                    .data ??
                []);
      } else {
        return ResponseWrapper.error(message: "");
      }
    } catch (e) {
      handleException(e);
      return ResponseWrapper.error(message: "");
    }
  }

  @override
  Future<ResponseWrapper<ReportDaily>> createReport(
      ReportDaily reportDaily) async {
    accessToken = await localDataAccess.getAccessToken();
    try {
      final response = await dio.post('/reportDaily/create',
          data: _reportDataMapper.mapToData(reportDaily).toJson()
            ..removeWhere((key, value) => value == null),
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));
      if (response.statusCode == 200) {
        return ResponseWrapper.success(
            data: _reportDataMapper
                .mapToEntity(ReportResponse.fromJson(response.data)));
      }
      return ResponseWrapper.error(message: "");
    } catch (e) {
      handleException(e);
      return ResponseWrapper.error(message: "");
    }
  }

  @override
  Future<ResponseWrapper<ReportDaily>> getReport(String reportId) async {
    accessToken = await localDataAccess.getAccessToken();
    try {
      final response = await dio.get('/reportDaily/detail',
          queryParameters: {"EeportId": reportId},
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));
      if (response.statusCode == 200) {
        return ResponseWrapper.success(
            data: _reportDataMapper
                .mapToEntity(ReportResponse.fromJson(response.data)));
      }
      return ResponseWrapper.error(message: "");
    } catch (e) {
      return ResponseWrapper.error(message: "");
    }
  }

  @override
  Future<ResponseWrapper<void>> deleteReport(String reportId) async {
    accessToken = await localDataAccess.getAccessToken();
    try {
      final response = await dio.delete('/reportDaily/delete',
          data: {"ReportId": reportId},
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));
      if (response.statusCode == 200) {
        return ResponseWrapper.success(data: null);
      }
      return ResponseWrapper.error(message: "");
    } catch (e) {
      return ResponseWrapper.error(message: "");
    }
  }

  @override
  Future<ResponseWrapper<ReportDaily>> updateReport(
      ReportDaily reportDaily) async {
    accessToken = await localDataAccess.getAccessToken();
    try {
      final response = await dio.put('/reportDaily/update',
          data: _reportDataMapper.mapToData(reportDaily).toJson(),
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));
      if (response.statusCode == 200) {
        return ResponseWrapper.success(
            data: _reportDataMapper
                .mapToEntity(ReportResponse.fromJson(response.data)));
      }
      return ResponseWrapper.error(message: "");
    } catch (e) {
      return ResponseWrapper.error(message: "");
    }
  }
}
