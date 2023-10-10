import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../config/config.dart';
import '../../../di/di.dart';

import '../../../domain/entity/okr/key_result/key_result.dart';
import '../../../domain/entity/okr/objective/objective.dart';
import '../../../domain/entity/okr/okr_wrapper/okr.dart';
import '../../../domain/entity/okr/unit/unit.dart';
import '../../../domain/entity/okr/task/task.dart';
import '../../../domain/entity/user/user.dart';
import '../../../domain/mapper/okr_data_mapper.dart';
import '../../../domain/mapper/unit_data_mapper.dart';
import '../../../domain/mapper/user_data_mapper.dart';
import '../../exceptions/handle_exception.dart';
import '../../../domain/mapper/task_data_mapper.dart';
import '../../model/api/base_response.dart';
import '../../model/okr_response/objective_response.dart';
import '../../model/okr_response/okr_response.dart';
import '../../model/unit_response/unit_response.dart';
import '../../model/user/user_response/user_response.dart';
import '../interceptor/dio_base_options.dart';
import '../interceptor/interceptor.dart';
import '../local/local_data_access.dart';
import '../../model/okr/task/task_response/task_response.dart';
import 'okr_repository.dart';

class OKRRepositoryImpl extends OKRRepository {
  final Dio dio = getIt.get<Dio>();
  final LocalDataAccess localDataAccess = getIt.get<LocalDataAccess>();
  String accessToken = '';
  final ObjectiveDataMapper _objectiveDataMapper =
      getIt.get<ObjectiveDataMapper>();
  final OKRDataMapper _okrDataMapper = getIt.get<OKRDataMapper>();
  final UnitDataMapper _unitDataMapper = getIt.get<UnitDataMapper>();
  final TaskDataMapper _taskDataMapper = getIt.get();
  final UserDataMapper _userDataMapper = getIt.get();
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
  Future<ResponseWrapper<List<UserEntity>>> addUserInUnit(
      String unitId, List<String>? memberIds) async {
    accessToken = await localDataAccess.getAccessToken();
    try {
      final response = await dio.post(
        EndPoints.addMemberToUnit,
        data: {"unitId": unitId, "listId": memberIds, "ranked": 0},
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );

      if (response.statusCode == 200) {
        return ResponseWrapper.success(
          data: List.from(
            (response.data as List).map(
                (e) => _userDataMapper.mapToEntity(UserResponse.fromJson(e))),
          ),
        );
      }
      return ResponseWrapper.error(message: "");
    } catch (e) {
      handleException(e);
      return ResponseWrapper.error(message: "");
    }
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
  Future<ResponseWrapper<Task>> createTask(Task task) async {
    accessToken = await localDataAccess.getAccessToken();
    try {
      final response = await dio.post(
        EndPoints.createTask,
        data: {
          "taskName": task.title,
          "description": task.description,
          "dueDate": task.endDate,
          // "completeDate": task.,
          "parentId": task.parrentTask,
          "point": task.point,
          "assigneeId": task.assignee?.id,
          "assigneerId": task.assigner?.id,
          "keyResultId": task.keyResultId,
          "status": task.status,
          "priority": task.priority
        }..removeWhere((key, value) => value == null),
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );

      if (response.statusCode == 200) {
        return ResponseWrapper.success(
            data: _taskDataMapper
                .mapToEntity(TaskResponse.fromJson(response.data)));
      }
      return ResponseWrapper.error(message: "");
    } catch (e) {
      handleException(e);
      return ResponseWrapper.error(message: "");
    }
  }

  @override
  Future<ResponseWrapper<Task>> updateTask(Task task) async {
    accessToken = await localDataAccess.getAccessToken();
    try {
      final response = await dio.patch(EndPoints.updateTask,
          data: {
            "id": task.id,
            "taskName": task.title,
            "description": task.description,
            "dueDate": task.endDate,
            // "completeDate": task.,
            "parentId": task.parrentTask?.id,
            "point": task.point,
            "assigneeId": task.assignee?.id,
            "assigneerId": task.assigner?.id,
            "keyResultId": task.keyResultId,
            "status": task.status,
            "priority": task.priority,
          }..removeWhere((key, value) => value == null),
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));

      if (response.statusCode == 200) {
        return ResponseWrapper.success(
            data: _taskDataMapper
                .mapToEntity(TaskResponse.fromJson(response.data)));
      }
      return ResponseWrapper.error(message: "");
    } catch (e) {
      handleException(e);
      return ResponseWrapper.error(message: "");
    }
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
  Future<ResponseWrapper<int>> deleteTask(Task task) async {
    accessToken = await localDataAccess.getAccessToken();
    try {
      final response = await dio.delete(
        EndPoints.deleteTask,
        data: {"taskId": task.id},
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );

      if (response.statusCode == 200) {
        return ResponseWrapper.success(data: 1);
      } else {
        return ResponseWrapper.error(message: "");
      }
    } catch (e) {
      handleException(e);
      return ResponseWrapper.error(message: "");
    }
  }

  @override
  Future<ResponseWrapper<int>> deleteUnit(String id) async {
    accessToken = await localDataAccess.getAccessToken();
    try {
      final response = await dio.delete(
        EndPoints.deleteUnit,
        data: {"id": id},
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );

      if (response.statusCode == 200) {
        return ResponseWrapper.success(data: response.data);
      } else {
        return ResponseWrapper.error(message: "");
      }
    } catch (e) {
      handleException(e);
      return ResponseWrapper.error(message: "");
    }
  }

  @override
  Future<ResponseWrapper<int>> deleteUserInUnit(
      String unitId, List<String>? memberIds) async {
    accessToken = await localDataAccess.getAccessToken();
    try {
      final response = await dio.delete(
        EndPoints.deleteMemberFromUnit,
        data: {"listId": memberIds, "unitId": unitId},
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );

      if (response.statusCode == 200) {
        return ResponseWrapper.success(data: response.data);
      }
      return ResponseWrapper.error(message: "");
    } catch (e) {
      handleException(e);
      return ResponseWrapper.error(message: "");
    }
  }

  @override
  Future<ResponseWrapper<List<Objective>>> getAllChildObjectiveOfAnObjective() {
    // TODO: implement getAllChildObjectiveOfAnObjective
    throw UnimplementedError();
  }

  @override
  Future<ResponseWrapper<List<KeyResult>>> getAllKeyResultOfObjective(
      String? objectiveId) async {
    accessToken = await localDataAccess.getAccessToken();
    try {
      final response = await dio.get(
          '${EndPoints.getAllKeyResult}?ObjectiveId=$objectiveId',
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));

      if (response.statusCode == 200) {
        return ResponseWrapper.success(
          data: List.from((response.data as List).map((e) =>
              _objectiveDataMapper.mapToEntity(ObjectiveResponse.fromJson(e)))),
        );
      }
      return ResponseWrapper.error(message: "");
    } catch (e) {
      handleException(e);
      return ResponseWrapper.error(message: "");
    }
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
  Future<ResponseWrapper<List<Task>>> getAllTaskOfUser(
      {required int page, int pageSize = 10, String? userId}) async {
    accessToken = await localDataAccess.getAccessToken();
    try {
      final response = await dio.get(
        EndPoints.getAllTaskOfUser,
        queryParameters: {
          "Page": page,
          "PageSize": pageSize,
          "UserId": userId ?? localDataAccess.getUserId(),
        },
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );
      if (response.statusCode == 200) {
        final responsePaging =
            DefaultPagingResponse<List<TaskResponse>>.fromJson(
          response.data,
          (json) =>
              (json as List).map((e) => TaskResponse.fromJson(e)).toList(),
        );
        return ResponseWrapper.success(
          data: List.from(
            (responsePaging.data as List).map(
              (e) => _taskDataMapper.mapToEntity(e),
            ),
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
  Future<ResponseWrapper<List<UserEntity>>> getAllUsersInUnit(
      {String? unitId, required int page, int pageSize = 10}) async {
    accessToken = await localDataAccess.getAccessToken();
    try {
      final response = await dio.get(
        EndPoints.getAllUserInUnit,
        queryParameters: {
          "UnitId": unitId,
          "Page": page,
          "PageSize": pageSize,
        }..removeWhere((key, value) => value == null),
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );

      if (response.statusCode == 200) {
        final responsePaging =
            DefaultPagingResponse<List<UserResponse>>.fromJson(
          response.data,
          (json) =>
              (json as List).map((e) => UserResponse.fromJson(e)).toList(),
        );
        return ResponseWrapper.success(
          data: List.from(
            (responsePaging.data as List).map(
              (e) => _userDataMapper.mapToEntity(e),
            ),
          ),
        );
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
  Future<ResponseWrapper<Task>> getTaskDetails(String taskId) async {
    accessToken = await localDataAccess.getAccessToken();
    try {
      final response = await dio.get(EndPoints.getTaskDetail,
          queryParameters: {
            "TaskId": taskId,
          },
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));

      if (response.statusCode == 200) {
        return ResponseWrapper.success(
            data: _taskDataMapper
                .mapToEntity(TaskResponse.fromJson(response.data)));
      }
      return ResponseWrapper.error(message: "");
    } catch (e) {
      handleException(e);
      return ResponseWrapper.error(message: "");
    }
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
  Future<ResponseWrapper<Unit>> updateUnit(Unit unit) async {
    accessToken = await localDataAccess.getAccessToken();
    try {
      final response = await dio.post(
        EndPoints.updateUnit,
        data: _unitDataMapper.mapToData(unit).toJson(),
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );

      if (response.statusCode == 200) {
        return ResponseWrapper.success(
          data:
              _unitDataMapper.mapToEntity(UnitResponse.fromJson(response.data)),
        );
      }
      return ResponseWrapper.error(message: "");
    } catch (e) {
      handleException(e);
      return ResponseWrapper.error(message: "");
    }
  }

  @override
  Future<ResponseWrapper<UserEntity>> updateUserInUnit() {
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

  @override
  Future<ResponseWrapper<OKR>> getOKRDetail(
      {required String okrId, required String unitId}) async {
    accessToken = await localDataAccess.getAccessToken();
    try {
      final response = await dio.get(EndPoints.detailOKR,
          queryParameters: {
            "OKRId": okrId,
            "UnitId": unitId,
          },
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));

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
}
