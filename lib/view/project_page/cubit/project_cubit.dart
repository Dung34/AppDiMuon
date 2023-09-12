import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/model/api/base_response.dart';
import '../../../data/repository/remote/project_list_repository.dart';
import '../../../di/di.dart';
import '../../../domain/entity/project/project.dart';

part 'project_state.dart';

class ProjectCubit extends Cubit<ProjectState> {
  final ProjectListRepository _projectRepository =
      getIt.get<ProjectListRepository>();

  ProjectCubit() : super(EventInitial());

  final List<Project> projects = [];

  getAllProject({
    List<Project>? data,
    int? totalCount,
  }) async {
    emit(EventInitial());
    final response = await _projectRepository.getAllProject();
    if (response.status == ResponseStatus.success) {
      projects.clear();
      projects.addAll(response.data ?? []);
      emit(EventGetAllProjectSuccessState(projects));
    } else {
      emit(EventGetAllProjectFailedState());
    }
  }
}
