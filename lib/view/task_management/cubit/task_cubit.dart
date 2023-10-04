import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/api/base_response.dart';
import '../../../data/repository/remote/okr_repository.dart';
import '../../../di/di.dart';
import '../../../domain/entity/okr/task/task.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  final OKRRepository _okrRepository = getIt.get();

  TaskCubit() : super(TaskInitial());

  getAllTask({String? user, int page = 1, int pageSize = 10}) async {
    final response = await _okrRepository.getAllTaskOfUser();
    if (response.status == ResponseStatus.success) {
      emit(TaskGetAllTaskSuccessState(taskList: response.data ?? []));
    } else {
      emit(TaskGetAllTaskFailedState());
    }
  }
}
