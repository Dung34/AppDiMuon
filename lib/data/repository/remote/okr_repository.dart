import '../../../domain/entity/okr/objective/objective.dart';
import '../../model/api/base_response.dart';

abstract class OKRRepository {
  Future<ResponseWrapper<Objective>> createObjective();

  Future<ResponseWrapper<Objective>> updateObjective();
}
