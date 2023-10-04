import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../config/config.dart';
import '../../../di/di.dart';
import '../../../domain/entity/okr/key_result/key_result.dart';
import '../../../domain/entity/okr/objective/objective.dart';
import '../../../domain/entity/okr/task/task.dart';
import '../../../domain/mapper/task_data_mapper.dart';
import '../../exceptions/handle_exception.dart';
import '../../model/api/base_response.dart';
import '../../model/okr/task/task_response/task_response.dart';
import '../interceptor/dio_base_options.dart';
import '../interceptor/interceptor.dart';
import '../local/local_data_access.dart';
import 'okr_repository.dart';

class OKRRepositoryImpl extends OKRRepository {
  final Dio dio = getIt.get();
  final LocalDataAccess localDataAccess = getIt.get<LocalDataAccess>();
  final AppInterceptor appInterceptor = getIt.get();
  String accessToken = "";

  OKRRepositoryImpl() {
    dio
      ..options =
          DioBaseOptions(baseUrl: Environment.resourcesBaseUrl).baseOption
      ..interceptors.add(appInterceptor.queueInterceptor(dio: dio));
    dio.interceptors.add(PrettyDioLogger(
      responseBody: true,
      requestBody: true,
      requestHeader: true,
    ));
  }

  final TaskDataMapper _taskDataMapper = getIt.get();

  @override
  Future<ResponseWrapper<KeyResult>> createKeyResult() {
    // TODO: implement createKeyResult
    throw UnimplementedError();
  }

  @override
  Future<ResponseWrapper<Objective>> createObjective() {
    // TODO: implement createObjective
    throw UnimplementedError();
  }

  @override
  Future<ResponseWrapper<Task>> createTask() {
    // TODO: implement createTask
    throw UnimplementedError();
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
  Future<ResponseWrapper<List<Objective>>> getAllObjectiveOfOKR() {
    // TODO: implement getAllObjectiveOfOKR
    throw UnimplementedError();
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
  Future<ResponseWrapper<List<Task>>> getAllTaskOfUser({String? userId}) async {
    accessToken = await localDataAccess.getAccessToken();
    try {
      final response = await dio.get(
        EndPoints.getAllTaskOfUser,
        queryParameters: {
          "UserId": userId ?? localDataAccess.getUserId(),
        },
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );
      if (response.statusCode == 200) {
        return ResponseWrapper.success(
          data: List.from(
            (response.data as List).map(
              (e) => _taskDataMapper.mapToEntity(TaskResponse.fromJson(e)),
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
  Future<ResponseWrapper<KeyResult>> getKeyResultDetails() {
    // TODO: implement getKeyResultDetails
    throw UnimplementedError();
  }

  @override
  Future<ResponseWrapper<Objective>> getObjectiveDetails() {
    // TODO: implement getObjectiveDetails
    throw UnimplementedError();
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
}
