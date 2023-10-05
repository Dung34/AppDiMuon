import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../config/config.dart';
import '../../../di/di.dart';
import '../../../domain/entity/okr/key_result/key_result.dart';
import '../../../domain/entity/okr/objective/objective.dart';
import '../../../domain/entity/okr/okr_wrapper/okr.dart';
import '../../../domain/entity/okr/unit/unit.dart';
import '../../../domain/entity/project/task.dart';
import '../../../domain/mapper/okr_data_mapper.dart';
import '../../../domain/mapper/unit_data_mapper.dart';
import '../../exceptions/handle_exception.dart';
import '../../model/api/base_response.dart';
import '../../model/okr_response/objective_response.dart';
import '../../model/okr_response/okr_response.dart';
import '../../model/old_login/login_response.dart';
import '../../model/unit_response/unit_response.dart';
import '../interceptor/dio_base_options.dart';
import '../interceptor/interceptor.dart';
import '../local/local_data_access.dart';
import 'okr_repository.dart';

class OKRRepositoryImpl extends OKRRepository {
  final Dio dio = getIt.get<Dio>();
  final LocalDataAccess localDataAccess = getIt.get<LocalDataAccess>();
  String accessToken = '';
  final ObjectiveDataMapper _objectiveDataMapper =
      getIt.get<ObjectiveDataMapper>();
  final OKRDataMapper _okrDataMapper = getIt.get<OKRDataMapper>();
  final UnitDataMapper _unitDataMapper = getIt.get<UnitDataMapper>();
  final AppInterceptor appInterceptor = getIt.get<AppInterceptor>();

  OKRRepositoryImpl() {
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
  Future<ResponseWrapper<User>> addUserInUnit() {
    // TODO: implement addUserInUnit
    throw UnimplementedError();
  }

  @override
  Future<ResponseWrapper<KeyResult>> createKeyResult() {
    // TODO: implement createKeyResult
    throw UnimplementedError();
  }

  @override
  Future<ResponseWrapper<Objective>> createObjective(
      Objective objective) async {
    accessToken = await localDataAccess.getAccessToken();
    try {
      final response = await dio.post(
        EndPoints.createObjective,
        data: {
          "title": objective.title,
          "description": objective.description,
          "okRsId": objective.okrId,
          "unitId": objective.unitId,
          "process": objective.process,
          "relativeObjectiveId": objective.relatedObjective
        },
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );

      if (response.statusCode == 200) {
        return ResponseWrapper.success(
            data: _objectiveDataMapper
                .mapToEntity(ObjectiveResponse.fromJson(response.data)));
      }
      return ResponseWrapper.error(message: "");
    } catch (e) {
      handleException(e);
      return ResponseWrapper.error(message: "");
    }
  }

  @override
  Future<ResponseWrapper<OKR>> createOKR(OKR okr) async {
    accessToken = await localDataAccess.getAccessToken();
    try {
      final response = await dio.post(
        EndPoints.createOKR,
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
        data: {
          "name": okr.name,
          "description": okr.description,
          "unitId": okr.unitId
        },
      );

      if (response.statusCode == 200) {
        return ResponseWrapper.success(
            data: _okrDataMapper
                .mapToEntity(OKRResponse.fromJson(response.data)));
      }
      return ResponseWrapper.error(message: "");
    } catch (e) {
      handleException(e);
      return ResponseWrapper.error(message: "");
    }
  }

  @override
  Future<ResponseWrapper<Task>> createTask() {
    // TODO: implement createTask
    throw UnimplementedError();
  }

  @override
  Future<ResponseWrapper<Unit>> createUnit(Unit unit) async {
    accessToken = await localDataAccess.getAccessToken();
    try {
      final response = await dio.post(
        EndPoints.createUnit,
        data: {
          "name": unit.name,
          "parentId": unit.parrentId,
          "description": unit.description,
          "coverImage": unit.coverImage
        },
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );

      if (response.statusCode == 200) {
        return ResponseWrapper.success(
            data: _unitDataMapper
                .mapToEntity(UnitResponse.fromJson(response.data)));
      }
      return ResponseWrapper.error(message: "");
    } catch (e) {
      handleException(e);
      return ResponseWrapper.error(message: "");
    }
  }

  @override
  Future<ResponseWrapper<int>> deleteKeyResult() {
    // TODO: implement deleteKeyResult
    throw UnimplementedError();
  }

  @override
  Future<ResponseWrapper<int>> deleteObjective() {
    // TODO: implement deleteObjective
    throw UnimplementedError();
  }

  @override
  Future<ResponseWrapper<int>> deleteTask() {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }

  @override
  Future<ResponseWrapper<int>> deleteUnit() {
    // TODO: implement deleteUnit
    throw UnimplementedError();
  }

  @override
  Future<ResponseWrapper<int>> deleteUserInUnit() {
    // TODO: implement deleteUserInUnit
    throw UnimplementedError();
  }

  @override
  Future<ResponseWrapper<List<Objective>>> getAllChildObjectiveOfAnObjective() {
    // TODO: implement getAllChildObjectiveOfAnObjective
    throw UnimplementedError();
  }

  @override
  Future<ResponseWrapper<List<KeyResult>>> getAllKeyResultOfObjective() {
    // TODO: implement getAllKeyResultOfObjective
    throw UnimplementedError();
  }

  @override
  Future<ResponseWrapper<List<Objective>>> getAllObjective(
      {String? okrId, String? unitId}) async {
    accessToken = await localDataAccess.getAccessToken();
    try {
      String link = okrId == null
          ? 'UnitId=$unitId'
          : unitId == null
              ? 'OKRsId=$okrId'
              : 'OKRsId=$okrId&UnitId=$unitId';
      final response = await dio.get('${EndPoints.getAllObjectives}?$link',
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));

      if (response.statusCode == 200) {
        return ResponseWrapper.success(
            data: _okrDataMapper
                .mapToEntity(OKRResponse.fromJson(response.data))
                .objectives!);
      }
      return ResponseWrapper.error(message: "");
    } catch (e) {
      handleException(e);
      return ResponseWrapper.error(message: "");
    }
  }

  @override
  Future<ResponseWrapper<List<Objective>>> getAllObjectiveOfParentUnit() {
    // TODO: implement getAllObjectiveOfParentUnit
    throw UnimplementedError();
  }

  @override
  Future<ResponseWrapper<List<Task>>> getAllRelatedTaskOfTask() {
    // TODO: implement getAllRelatedTaskOfTask
    throw UnimplementedError();
  }

  @override
  Future<ResponseWrapper<List<Task>>> getAllTaskOfKR() {
    // TODO: implement getAllTaskOfKR
    throw UnimplementedError();
  }

  @override
  Future<ResponseWrapper<List<Task>>> getAllTaskOfSubtask() {
    // TODO: implement getAllTaskOfSubtask
    throw UnimplementedError();
  }

  @override
  Future<ResponseWrapper<List<Task>>> getAllTaskOfUser() {
    // TODO: implement getAllTaskOfUser
    throw UnimplementedError();
  }

  @override
  Future<ResponseWrapper<List<Unit>>> getAllUnits() async {
    accessToken = await localDataAccess.getAccessToken();
    try {
      final response = await dio.get(
          '${EndPoints.getAllUnit}?Page=1&PageSize=100',
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));

      if (response.statusCode == 200) {
        return ResponseWrapper.success(
          data: List.from(
            ((response.data as Map<String, dynamic>)['data'] as List).map(
                (e) => _unitDataMapper.mapToEntity(UnitResponse.fromJson(e))),
          ),
        );
      } else {
        return ResponseWrapper.error(message: "");
      }
    } catch (e) {
      handleException(e);
      return ResponseWrapper.error(message: "");
    }
  }

  @override
  Future<ResponseWrapper<List<User>>> getAllUsersInUnit(String? unitId) async {
    try {
      final response = await dio.get(
          '${EndPoints.getAllUserInUnit}?UnitId=$unitId&Page=1&PageSize=100');

      if (response.statusCode == 200) {
        return ResponseWrapper.error(message: "");
      }
      return ResponseWrapper.error(message: "");
    } catch (e) {
      handleException(e);
      return ResponseWrapper.error(message: "");
    }
  }

  @override
  Future<ResponseWrapper<KeyResult>> getKeyResultDetails() {
    // TODO: implement getKeyResultDetails
    throw UnimplementedError();
  }

  @override
  Future<ResponseWrapper<Objective>> getObjectiveDetails(
      String objectiveId, String unitId) async {
    accessToken = await localDataAccess.getAccessToken();
    try {
      final response = await dio.post(EndPoints.getObjectiveDetails,
          data: {"objectiveId": objectiveId, "unitId": unitId},
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));

      if (response.statusCode == 200) {
        return ResponseWrapper.success(
            data: _objectiveDataMapper
                .mapToEntity(ObjectiveResponse.fromJson(response.data)));
      }
      return ResponseWrapper.error(message: "");
    } catch (e) {
      handleException(e);
      return ResponseWrapper.error(message: "");
    }
  }

  @override
  Future<ResponseWrapper<Task>> getTaskDetails() {
    // TODO: implement getTaskDetails
    throw UnimplementedError();
  }

  @override
  Future<ResponseWrapper<KeyResult>> updateKeyResult() {
    // TODO: implement updateKeyResult
    throw UnimplementedError();
  }

  @override
  Future<ResponseWrapper<Objective>> updateObjective() {
    // TODO: implement updateObjective
    throw UnimplementedError();
  }

  @override
  Future<ResponseWrapper<Task>> updateTask() {
    // TODO: implement updateTask
    throw UnimplementedError();
  }

  @override
  Future<ResponseWrapper<Unit>> updateUnit() {
    // TODO: implement updateUnit
    throw UnimplementedError();
  }

  @override
  Future<ResponseWrapper<User>> updateUserInUnit() {
    // TODO: implement updateUserInUnit
    throw UnimplementedError();
  }

  @override
  Future<ResponseWrapper<Unit>> viewUnit(String unitId) async {
    accessToken = await localDataAccess.getAccessToken();
    try {
      final response = await dio.get('${EndPoints.viewUnit}?Id=$unitId',
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));

      if (response.statusCode == 200) {
        return ResponseWrapper.success(
            data: _unitDataMapper
                .mapToEntity(UnitResponse.fromJson(response.data)));
      }
      return ResponseWrapper.error(message: "");
    } catch (e) {
      handleException(e);
      return ResponseWrapper.error(message: "");
    }
  }
}
