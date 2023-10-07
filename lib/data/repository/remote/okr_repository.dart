import '../../../domain/entity/okr/key_result/key_result.dart';
import '../../../domain/entity/okr/objective/objective.dart';
import '../../../domain/entity/okr/okr_wrapper/okr.dart';
import '../../../domain/entity/okr/unit/unit.dart';
import '../../../domain/entity/project/task.dart';
import '../../model/api/base_response.dart';
import '../../model/old_login/login_response.dart';

abstract class OKRRepository {
  Future<ResponseWrapper<User>> addUserInUnit();

  Future<ResponseWrapper<KeyResult>> createKeyResult();

  Future<ResponseWrapper<Objective>> createObjective(Objective objective);

  Future<ResponseWrapper<OKR>> createOKR(OKR okr);

  Future<ResponseWrapper<Task>> createTask();

  Future<ResponseWrapper<Unit>> createUnit(Unit unit);

  Future<ResponseWrapper<int>> deleteKeyResult();

  Future<ResponseWrapper<int>> deleteObjective();

  Future<ResponseWrapper<int>> deleteTask();

  Future<ResponseWrapper<int>> deleteUnit(String id);

  Future<ResponseWrapper<int>> deleteUserInUnit();

  Future<ResponseWrapper<List<Objective>>> getAllChildObjectiveOfAnObjective();

  Future<ResponseWrapper<List<KeyResult>>> getAllKeyResultOfObjective();

  Future<ResponseWrapper<List<Objective>>> getAllObjective(
      {String? unitId, String? okrId});

  Future<ResponseWrapper<List<Objective>>> getAllObjectiveOfParentUnit();

  Future<ResponseWrapper<List<Task>>> getAllRelatedTaskOfTask();

  Future<ResponseWrapper<List<Task>>> getAllTaskOfKR();

  Future<ResponseWrapper<List<Task>>> getAllTaskOfUser();

  Future<ResponseWrapper<List<Task>>> getAllTaskOfSubtask();

  Future<ResponseWrapper<List<Unit>>> getAllUnits();

  Future<ResponseWrapper<List<User>>> getAllUsersInUnit(String? unitId);

  Future<ResponseWrapper<KeyResult>> getKeyResultDetails();

  Future<ResponseWrapper<Objective>> getObjectiveDetails(
      String objectiveId, String unitId);

  Future<ResponseWrapper<Task>> getTaskDetails();

  Future<ResponseWrapper<KeyResult>> updateKeyResult();

  Future<ResponseWrapper<Objective>> updateObjective();

  Future<ResponseWrapper<Task>> updateTask();

  Future<ResponseWrapper<Unit>> updateUnit();

  Future<ResponseWrapper<User>> updateUserInUnit();

  Future<ResponseWrapper<Unit>> viewUnit(String unitId);
}
