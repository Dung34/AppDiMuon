import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/api/base_response.dart';
import '../../../data/repository/remote/okr_repository.dart';
import '../../../di/di.dart';
import '../../../domain/entity/okr/task/activity/activity.dart';
import '../../../domain/entity/okr/task/task.dart';
import '../../../domain/entity/user/user.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  final OKRRepository _okrRepository = getIt.get();
  final String userId = "";

  TaskCubit() : super(TaskInitial());

  final List<Task> taskList = [];

  resetState() {
    emit(TaskInitial());
  }

  createTask(Task task) async {
    final response = await _okrRepository.createTask(task);
    if (response.status == ResponseStatus.success) {
      emit(TaskCreateSuccessState(task: response.data!));
    } else {
      emit(TaskCreateFailedState());
    }
  }

  getTaskDetail(String taskId) async {
    final response = await _okrRepository.getTaskDetails(taskId);
    if (response.status == ResponseStatus.success) {
      emit(TaskGetDetailSuccessState(task: response.data!));
    } else {
      emit(TaskGetDetailFailedState());
    }
  }

  getAllTask({
    int page = 1,
    int pageSize = 10,
    int? status,
    String? userId,
    String? keyWord,
    String? relatedTask,
    String? subTask, // pass sub task
    String? keyResultId,
  }) async {
    final response = await _okrRepository.getAllTaskOfUser(
        page: page,
        pageSize: pageSize,
        keyWord: keyWord,
        keyResultId: keyResultId,
        relatedTask: relatedTask,
        subTask: subTask);
    if (response.status == ResponseStatus.success) {
      taskList.clear();
      taskList.addAll(response.data ?? []);
      emit(TaskGetAllTaskSuccessState(taskList: taskList));
    } else {
      emit(TaskGetAllTaskFailedState());
    }
  }

  updateTask(Task task) async {
    final response = await _okrRepository.updateTask(task);
    if (response.status == ResponseStatus.success) {
      emit(TaskUpdateSuccessState(task: response.data!));
    } else {
      emit(TaskUpdateFailedState());
    }
  }

  deleteTask(Task task) async {
    final response = await _okrRepository.deleteTask(task);
    if (response.status == ResponseStatus.success) {
      emit(TaskDeleteSuccessState(task: task));
    } else {
      emit(TaskDeleteFailedState());
    }
  }

  changeAssigner(UserEntity user) {
    emit(TaskChangeAssigneer(user: user));
  }

  changeAssignee(UserEntity user) {
    emit(TaskChangeAssignee(user: user));
  }

  getActitivy(String? taskId) async {
    final response = await _okrRepository.getActivityOfTask(taskId!);
    if (response.status == ResponseStatus.success) {
      emit(TaskGetActivitySuccess(listActivities: response.data!));
    } else {
      emit(TaskGetActivityFailed());
    }
  }
}
