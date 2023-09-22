import '../../data/constant/constants.dart';
import '../../data/mapper/base/base_data_mapper.dart';
import '../../data/model/project_list_response/project_list_response.dart';
import '../../data/model/project_list_response/project_response.dart';
import '../entity/project/project.dart';
import '../entity/project/project_list.dart';

class ProjectListDataMapper
    extends BaseDataMapper<ProjectListResponse, ProjectList>
    with DataMapperMixin {
  @override
  ProjectList mapToEntity(ProjectListResponse? data) {
    return ProjectList(
      data: data?.data,
      totalCount: data?.totalCount,
    );
  }

  String statusToString(int status) {
    switch (status) {
      case ProjectStatus.uncompleted:
        return ProjectStatusStr.uncompleted;
      case ProjectStatus.completed:
        return ProjectStatusStr.completed;
      default:
        return 'ERROR';
    }
  }

  @override
  ProjectListResponse mapToData(ProjectList entity) {
    return ProjectListResponse(
      data: entity.data,
      totalCount: entity.totalCount,
    );
  }
}

class ProjectDataMapper extends BaseDataMapper<ProjectResponse, Project> {
  @override
  Project mapToEntity(ProjectResponse? data) {
    return Project(
        name: data?.name,
        status: data?.status,
        projectMembers: data?.projectMembers,
        tasks: data?.tasks);
  }
}
