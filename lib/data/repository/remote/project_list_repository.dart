import '../../../domain/entity/project/project.dart';
import '../../model/api/base_response.dart';

abstract class ProjectListRepository {
  Future<ResponseWrapper<List<Project>>> getAllProject();

  Future<ResponseWrapper<Project>> getProjectById(String id);
}
