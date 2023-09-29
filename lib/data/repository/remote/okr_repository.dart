import '../../../domain/entity/okr/key_result/key_result.dart';
import '../../../domain/entity/okr/objective/objective.dart';
import '../../../domain/entity/project/task.dart';
import '../../model/api/base_response.dart';

abstract class OKRRepository {
  Future<ResponseWrapper<KeyResult>> createKeyResult();

  Future<ResponseWrapper<Objective>> createObjective();

  Future<ResponseWrapper<Task>> createTask();

  Future<ResponseWrapper<int>> deleteKeyResult();

  Future<ResponseWrapper<int>> deleteObjective();

  Future<ResponseWrapper<int>> deleteTask();

  Future<ResponseWrapper<List<Objective>>> getAllChildObjectiveOfAnObjective();

  Future<ResponseWrapper<List<KeyResult>>> getAllKeyResultOfObjective();

  Future<ResponseWrapper<List<Objective>>> getAllObjectiveOfOKR();

  Future<ResponseWrapper<List<Objective>>> getAllObjectiveOfParentUnit();

  Future<ResponseWrapper<List<Task>>> getAllRelatedTaskOfTask();

  Future<ResponseWrapper<List<Task>>> getAllTaskOfKR();

  Future<ResponseWrapper<List<Task>>> getAllTaskOfUser();

  Future<ResponseWrapper<List<Task>>> getAllTaskOfSubtask();

  Future<ResponseWrapper<KeyResult>> getKeyResultDetails();

  Future<ResponseWrapper<Objective>> getObjectiveDetails();

  Future<ResponseWrapper<Task>> getTaskDetails();

  Future<ResponseWrapper<int>> updateKeyResult();

  Future<ResponseWrapper<int>> updateObjective();

  Future<ResponseWrapper<int>> updateTask();
}
