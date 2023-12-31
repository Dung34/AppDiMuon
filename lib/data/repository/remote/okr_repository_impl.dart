import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../config/config.dart';
import '../../../di/di.dart';

import '../../../domain/entity/okr/key_result/key_result.dart';
import '../../../domain/entity/okr/objective/objective.dart';
import '../../../domain/entity/okr/okr_wrapper/okr.dart';
import '../../../domain/entity/okr/task/activity/activity.dart';
import '../../../domain/entity/okr/unit/unit.dart';
import '../../../domain/entity/okr/task/task.dart';
import '../../../domain/entity/user/user.dart';
import '../../../domain/mapper/activity_data_mapper.dart';
import '../../../domain/mapper/okr_data_mapper.dart';
import '../../../domain/mapper/unit_data_mapper.dart';
import '../../../domain/mapper/user_data_mapper.dart';
import '../../exceptions/handle_exception.dart';
import '../../../domain/mapper/task_data_mapper.dart';
import '../../model/activities/activities_response.dart';
import '../../model/api/base_response.dart';
import '../../model/okr_response/key_result_response.dart';
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
  final KeyResultDataMapper _keyResultDataMapper =
      getIt.get<KeyResultDataMapper>();
  final ObjectiveDataMapper _objectiveDataMapper =
      getIt.get<ObjectiveDataMapper>();
  final OKRDataMapper _okrDataMapper = getIt.get<OKRDataMapper>();
  final UnitDataMapper _unitDataMapper = getIt.get<UnitDataMapper>();
  final TaskDataMapper _taskDataMapper = getIt.get();
  final UserDataMapper _userDataMapper = getIt.get();
  final AppInterceptor appInterceptor = getIt.get<AppInterceptor>();
  final ActivityMapper _activityMapper = getIt.get<ActivityMapper>();

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
  Future<ResponseWrapper<KeyResult>> createKeyResult(
      KeyResult keyResult) async {
    accessToken = await localDataAccess.getAccessToken();

    try {
      final response = await dio.post(EndPoints.createKeyResult,
          data: _keyResultDataMapper.mapToData(keyResult).toJson(),
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));

      if (response.statusCode == 200) {
        return ResponseWrapper.success(
          data: _keyResultDataMapper
              .mapToEntity(KeyResultResponse.fromJson(response.data)),
        );
      }
      return ResponseWrapper.error(message: "");
    } catch (e) {
      handleException(e);
      return ResponseWrapper.error(message: "");
    }
  }

  @override
  Future<ResponseWrapper<Objective>> createObjective(
      Objective objective, List<String> related) async {
    accessToken = await localDataAccess.getAccessToken();
    try {
      final response = await dio.post(
        EndPoints.createObjective,
        data: {
          "title": objective.title,
          "description": objective.description,
          "okRsId": objective.okrId,
          "unitId": objective.unitId,
          "relatedObjectiveId": related
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
          "parentId": task.parrentTask?.id,
          "relatedId":
              (task.relatedTask != null && task.relatedTask!.isNotEmpty)
                  ? task.relatedTask?.first.id
                  : null,
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
          "parentId": unit.parentId,
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
  Future<ResponseWrapper<int>> deleteKeyResult(String id) async {
    accessToken = await localDataAccess.getAccessToken();

    try {
      final response = await dio.delete(EndPoints.deleteKeyResult,
          data: {"keyResultId": id},
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));

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
  Future<ResponseWrapper<int>> deleteObjective(String id) async {
    accessToken = await localDataAccess.getAccessToken();
    try {
      final response = await dio.delete(EndPoints.deleteObjective,
          data: {"objectiveId": id},
          options: Options(headers: {"Authorization": "Bearer $accessToken"}));

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
  Future<ResponseWrapper<List<KeyResult>>> getAllKeyResult(
      String? objectiveId) async {
    accessToken = await localDataAccess.getAccessToken();

    // return ResponseWrapper.success(data: [
    //   _keyResultDataMapper.mapToEntity(KeyResultResponse()),
    //   _keyResultDataMapper.mapToEntity(KeyResultResponse()),
    //   _keyResultDataMapper.mapToEntity(KeyResultResponse()),
    // ]);

    try {
      final response = await dio.get(EndPoints.getAllKeyResult,
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
          queryParameters: {"ObjectiveId": objectiveId});

      if (response.statusCode == 200) {
        return ResponseWrapper.success(
          data: List.from((response.data as List).map((e) =>
              _keyResultDataMapper.mapToEntity(KeyResultResponse.fromJson(e)))),
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
      final response = await dio.get(EndPoints.getAllObjectives,
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
          queryParameters: {
            "UnitId": unitId,
            "Page": 1,
            "PageSize": 100,
          });

      if (response.statusCode == 200) {
        return ResponseWrapper.success(
          data: _objectiveDataMapper.mapToListEntity(List.from(
            (response.data["objectives"]["data"] as List)
                .map((e) => ObjectiveResponse.fromJson(e)),
          )),
        );
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
  Future<ResponseWrapper<List<Task>>> getAllTaskOfUser({
    required int page,
    int pageSize = 10,
    int? status,
    String? userId,
    String? keyWord,
    String? relatedTask,
    String? subTask,
    String? keyResultId,
  }) async {
    accessToken = await localDataAccess.getAccessToken();
    try {
      final response = await dio.get(
        EndPoints.getAllTaskOfUser,
        queryParameters: {
          "Page": page,
          "PageSize": pageSize,
          "UserId": userId ?? localDataAccess.getUserId(),
          "KeyWord": keyWord,
          "KeyResultId": keyResultId,
        }..removeWhere((key, value) => value == null),
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
  Future<ResponseWrapper<List<Unit>>> getAllUnits(
      {String? tenantId, String? owner, int? status}) async {
    accessToken = await localDataAccess.getAccessToken();
    try {
      final response = await dio.get(
          '${EndPoints.getAllUnit}?Page=1&PageSize=100',
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
          queryParameters: {
            'TenantId': tenantId,
            'Owner': owner,
            'Status': status
          });

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
      {String? unitId, required int page, int pageSize = 100}) async {
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
      String objectiveId) async {
    accessToken = await localDataAccess.getAccessToken();
    try {
      final response = await dio.post(EndPoints.getObjectiveDetails,
          data: {"objectiveId": objectiveId},
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
  Future<ResponseWrapper<KeyResult>> updateKeyResult(
      KeyResult keyResult) async {
    accessToken = await localDataAccess.getAccessToken();

    try {
      final response = await dio.patch(EndPoints.updateKeyResult,
          data: _keyResultDataMapper.mapToData(keyResult),
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));

      if (response.statusCode == 200) {
        return ResponseWrapper.success(
            data: _keyResultDataMapper
                .mapToEntity(KeyResultResponse.fromJson(response.data)));
      }
      return ResponseWrapper.error(message: "");
    } catch (e) {
      handleException(e);
      return ResponseWrapper.error(message: "");
    }
  }

  @override
  Future<ResponseWrapper<Objective>> updateObjective(
      Objective objective) async {
    accessToken = await localDataAccess.getAccessToken();

    try {
      final response = await dio.post(
        EndPoints.updateObjective,
        data: {
          "description": objective.description,
          "title": objective.title,
          "objectiveId": objective.objectiveId
        },
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );

      if (response.statusCode == 200) {
        return ResponseWrapper.success(
          data: _objectiveDataMapper
              .mapToEntity(ObjectiveResponse.fromJson(response.data)),
        );
      }
      return ResponseWrapper.error(message: "");
    } catch (e) {
      handleException(e);
      return ResponseWrapper.error(message: "");
    }
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
      {String? okrId, String? unitId}) async {
    accessToken = await localDataAccess.getAccessToken();
    try {
      final response = await dio.get(EndPoints.detailOKR,
          queryParameters: {
            "OKRsId": okrId,
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

  @override
  Future<ResponseWrapper<List<Activity>>> getActivityOfTask(
      String taskId) async {
    accessToken = await localDataAccess.getAccessToken();
    try {
      final response = await dio.get('taskOKR/get-activity-task',
          queryParameters: {"TaskId": taskId, "Page": 1, "PageSize": 10},
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));
      if (response.statusCode == 200) {
        return ResponseWrapper.success(
            data: List.from((response.data as List).map((e) =>
                _activityMapper.mapToEntity(ActivityResponse.fromJson(e)))));
      } else {
        return ResponseWrapper.error(message: "");
      }
    } catch (e) {
      return ResponseWrapper.error(message: "");
    }
  }
}
