import '../../../domain/entity/okr/key_result/key_result.dart';
import '../../../domain/entity/okr/objective/objective.dart';
import '../../../domain/entity/project/task.dart';
import '../../model/api/base_response.dart';
import 'okr_repository.dart';

class OKRRepositoryImpl extends OKRRepository {
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
  Future<ResponseWrapper<List<Task>>> getAllTaskOfUser() {
    // TODO: implement getAllTaskOfUser
    throw UnimplementedError();
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
