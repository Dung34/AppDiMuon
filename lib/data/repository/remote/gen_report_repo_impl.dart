import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../config/config.dart';
import '../../../di/di.dart';
import '../../../domain/entity/taskoverview/general_report.dart';

import '../../../domain/mapper/general_report_mapper.dart';
import '../../../domain/mapper/list_gen_report_mapper.dart';
import '../../model/api/base_response.dart';
import '../../model/gereport_response/general_report_response.dart';
import '../../model/gereport_response/list_general_report_res.dart';
import '../interceptor/dio_base_options.dart';
import '../interceptor/interceptor.dart';
import '../local/local_data_access.dart';
import 'gen_report_repository.dart';

class GeneralReportRepositoryImpl implements GeneralReportRepository {
  final Dio dio = getIt.get<Dio>();
  final LocalDataAccess localDataAccess = getIt.get<LocalDataAccess>();
  String accessToken = "";
  final GeneralReportMapper _generalReportMapper =
      getIt.get<GeneralReportMapper>();
  final ListGeneralReportMapper _listGeneralReportMapper =
      getIt.get<ListGeneralReportMapper>();
  final AppInterceptor appInterceptor = getIt.get<AppInterceptor>();
  GeneralReportRepositoryImpl() {
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
  Future<ResponseWrapper<GeneralReport>> createGenReport(
      GeneralReport generalReport) async {
    accessToken = await localDataAccess.getAccessToken();
    try {
      final response = await dio.post('/reportOverview/create',
          data: _generalReportMapper.mapToData(generalReport).toJson()
            ..removeWhere((key, value) => value == null),
          options: Options(headers: {"Authorization": "Bearer $accessToken"}));
      if (response.statusCode == 200) {
        return ResponseWrapper.success(
            data: _generalReportMapper
                .mapToEntity(GeneralReportResponse.fromJson(response.data)));
      } else {
        return ResponseWrapper.error(message: "");
      }
    } catch (e) {
      return ResponseWrapper.error(message: "");
    }
  }

  @override
  Future<ResponseWrapper<void>> deleteGenReport(String reportId) async {
    accessToken = await localDataAccess.getAccessToken();
    try {
      final response = await dio.delete('/reportOverview/delete',
          data: {"reportOverviewId": reportId},
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

  @override
  Future<ResponseWrapper<List<GeneralReport>>> getAllGenReport(
      String userId) async {
    accessToken = await localDataAccess.getAccessToken();
    try {
      final response = await dio.get('/reportOverview/view-all-by-UserId',
          queryParameters: {"Id": userId, "Page": 1, "PageSize": 10},
          options: Options(headers: {"Authorization": "Bearer $accessToken"}));
      if (response.statusCode == 200) {
        return ResponseWrapper.success(
            data: _listGeneralReportMapper
                    .mapToEntity(ListGeneralReportRes.fromJson(response.data))
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
  Future<ResponseWrapper<GeneralReport>> getGenReport(String reportId) async {
    accessToken = await localDataAccess.getAccessToken();
    try {
      final response = await dio.get('/reportOverview/detail',
          queryParameters: {"ReportId": reportId},
          options: Options(headers: {"Authorization": "Bearer $accessToken "}));
      if (response.statusCode == 200) {
        return ResponseWrapper.success(
            data: _generalReportMapper
                .mapToEntity(GeneralReportResponse.fromJson(response.data)));
      } else {
        return ResponseWrapper.error(message: "");
      }
    } catch (e) {
      return ResponseWrapper.error(message: "");
    }
  }

  @override
  Future<ResponseWrapper<GeneralReport>> updateGenReport(
      GeneralReport generalReport) async {
    accessToken = await localDataAccess.getAccessToken();
    try {
      final response = await dio.put('reportOverview/update',
          data: _generalReportMapper.mapToData(generalReport).toJson()
            ..removeWhere((key, value) => value == null),
          options: Options(headers: {"Authorization": "Bearer $accessToken"}));
      if (response.statusCode == 200) {
        return ResponseWrapper.success(
            data: _generalReportMapper
                .mapToEntity(GeneralReportResponse.fromJson(response.data)));
      } else {
        return ResponseWrapper.error(message: "");
      }
    } catch (e) {
      return ResponseWrapper.error(message: "");
    }
  }
}
