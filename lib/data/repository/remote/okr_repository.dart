import '../../../domain/entity/okr/key_result/key_result.dart';
import '../../../domain/entity/okr/objective/objective.dart';
import '../../../domain/entity/okr/okr_wrapper/okr.dart';
import '../../../domain/entity/okr/unit/unit.dart';
import '../../../domain/entity/okr/task/task.dart';
import '../../../domain/entity/user/user.dart';
import '../../model/api/base_response.dart';

abstract class OKRRepository {
  Future<ResponseWrapper<List<UserEntity>>> addUserInUnit(
      String unitId, List<String>? memberIds);

  Future<ResponseWrapper<KeyResult>> createKeyResult(KeyResult keyResult);

  Future<ResponseWrapper<Objective>> createObjective(
      Objective objective, List<String> related);

  Future<ResponseWrapper<OKR>> createOKR(OKR okr);

  Future<ResponseWrapper<Task>> createTask(Task task);

  Future<ResponseWrapper<Unit>> createUnit(Unit unit);

  Future<ResponseWrapper<int>> deleteKeyResult(String id);

  Future<ResponseWrapper<int>> deleteObjective(String id);

  Future<ResponseWrapper<int>> deleteTask(Task task);

  Future<ResponseWrapper<int>> deleteUnit(String id);

  Future<ResponseWrapper<int>> deleteUserInUnit(
      String unitId, List<String>? memberIds);

  Future<ResponseWrapper<OKR>> getOKRDetail(
      {required String okrId, required String unitId});

  Future<ResponseWrapper<List<Objective>>> getAllChildObjectiveOfAnObjective();

  Future<ResponseWrapper<List<KeyResult>>> getAllKeyResult(String? objectiveId);

  Future<ResponseWrapper<List<Objective>>> getAllObjective(
      {String? unitId, String? okrId});

  Future<ResponseWrapper<List<Objective>>> getAllObjectiveOfParentUnit();

  Future<ResponseWrapper<List<Task>>> getAllRelatedTaskOfTask();

  Future<ResponseWrapper<List<Task>>> getAllTaskOfKR();

  Future<ResponseWrapper<List<Task>>> getAllTaskOfUser({
    required int page,
    int pageSize = 10,
    int? status,
    String? userId,
    String? keyWord,
    String? relatedTask,
    String? subTask,
    String? keyResultId,
  });

  Future<ResponseWrapper<List<Task>>> getAllTaskOfSubtask();

  Future<ResponseWrapper<List<Unit>>> getAllUnits();

  Future<ResponseWrapper<List<UserEntity>>> getAllUsersInUnit(
      {String? unitId, required int page, int pageSize = 10});

  Future<ResponseWrapper<KeyResult>> getKeyResultDetails();

  Future<ResponseWrapper<Objective>> getObjectiveDetails(String objectiveId);

  Future<ResponseWrapper<Task>> getTaskDetails(String taskId);

  Future<ResponseWrapper<KeyResult>> updateKeyResult(KeyResult keyResult);

  Future<ResponseWrapper<Objective>> updateObjective(Objective objective);

  Future<ResponseWrapper<Task>> updateTask(Task task);

  Future<ResponseWrapper<Unit>> updateUnit(Unit unit);

  Future<ResponseWrapper<UserEntity>> updateUserInUnit();

  Future<ResponseWrapper<Unit>> viewUnit(String unitId);
}
