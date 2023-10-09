import '../../../domain/entity/target/target.dart';
import '../../model/api/base_response.dart';

abstract class TargetRepository {
  Future<ResponseWrapper<List<Target>>> getAllTarget();
  Future<ResponseWrapper<Target>> getDeteilTarget(String id);
  Future<ResponseWrapper<Target>> createTarget(Target target);
  Future<ResponseWrapper<Target>> updateTarget(Target target);
  Future<ResponseWrapper<void>> deleteTarget(String id);
}
