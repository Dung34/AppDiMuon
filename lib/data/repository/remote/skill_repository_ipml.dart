import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../config/config.dart';
import '../../../di/di.dart';
import '../../../domain/entity/skill/skill.dart';
import '../../../domain/mapper/skill_data_mapper.dart';
import '../../model/api/base_response.dart';
import '../../model/skill/list_skill_response.dart';
import '../../model/skill/skill_response.dart';
import '../interceptor/dio_base_options.dart';
import '../interceptor/interceptor.dart';
import '../local/local_data_access.dart';
import 'skill_repository.dart';

class SkillRepositoryImplement implements SkillRepository {
  final Dio dio = getIt.get<Dio>();
  final LocalDataAccess localDataAccess = getIt.get<LocalDataAccess>();
  String accessToken = "";
  final AppInterceptor appInterceptor = getIt.get<AppInterceptor>();
  final SkillDataMapper _skillDataMapper = getIt.get<SkillDataMapper>();
  final ListSkillMapper _listSkillMapper = getIt.get<ListSkillMapper>();

  SkillRepositoryImplement() {
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
  Future<ResponseWrapper<List<Skill>>> getAllSkill(String userId) async {
    accessToken = await localDataAccess.getAccessToken();
    try {
      final response = await dio.get(EndPoints.getAllSkill,
          queryParameters: {"UserId": userId, "Page": 1, "PageSize": 10},
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));
      if (response.statusCode == 200) {
        return ResponseWrapper.success(
            data: _listSkillMapper
                    .mapToEntity(ListSkillResponse.fromJson(response.data))
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
  Future<ResponseWrapper<Skill>> getDetailSkill(String id) async {
    accessToken = await localDataAccess.getAccessToken();
    final userId = await localDataAccess.getIdToken();
    try {
      final response = await dio.get(EndPoints.getDetailSkill,
          queryParameters: {"Id": id, "UserId": userId},
          options: Options(headers: {"Authorization": "Bearer $accessToken"}));
      if (response.statusCode == 200) {
        return ResponseWrapper.success(
            data: _skillDataMapper
                .mapToEntity(SkillResponse.fromJson(response.data)));
      } else {
        return ResponseWrapper.error(message: " ");
      }
    } catch (e) {
      return ResponseWrapper.error(message: "");
    }
  }

  @override
  Future<ResponseWrapper<Skill>> updateSkill(Skill skill) async {
    accessToken = await localDataAccess.getAccessToken();
    try {
      final response = await dio.post(EndPoints.updateSkill,
          data: _skillDataMapper.mapToData(skill).toJson()
            ..removeWhere((key, value) => value == null),
          options: Options(headers: {"Authorization": "Bearer $accessToken"}));
      if (response.statusCode == 200) {
        return ResponseWrapper.success(
            data: _skillDataMapper
                .mapToEntity(SkillResponse.fromJson(response.data)));
      } else {
        return ResponseWrapper.error(message: "");
      }
    } catch (e) {
      return ResponseWrapper.error(message: "");
    }
  }

  @override
  Future<ResponseWrapper<Skill>> createSkill(Skill skill) async {
    accessToken = await localDataAccess.getAccessToken();
    try {
      final response = await dio.post(EndPoints.createSkill,
          data: _skillDataMapper.mapToData(skill).toJson()
            ..removeWhere((key, value) => value == null),
          options: Options(headers: {"Authorization": "Bearer $accessToken"}));
      if (response.statusCode == 200) {
        return ResponseWrapper.success(
            data: _skillDataMapper
                .mapToEntity(SkillResponse.fromJson(response.data)));
      } else {
        return ResponseWrapper.error(message: "");
      }
    } catch (e) {
      return ResponseWrapper.error(message: "");
    }
  }

  @override
  Future<ResponseWrapper<void>> deleteSkill(String id) async {
    accessToken = await localDataAccess.getAccessToken();
    try {
      final response = await dio.delete(EndPoints.deleteSkill,
          data: {"$id"},
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
