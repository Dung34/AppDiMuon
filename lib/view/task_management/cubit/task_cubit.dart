import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/api/base_response.dart';
import '../../../data/repository/remote/okr_repository.dart';
import '../../../di/di.dart';
import '../../../domain/entity/okr/task/task.dart';
import '../../../domain/entity/user/user.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  final OKRRepository _okrRepository = getIt.get();

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

  getAllTask({String? user, int page = 1, int pageSize = 10}) async {
    final response =
        await _okrRepository.getAllTaskOfUser(page: page, pageSize: pageSize);
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
      log('1');
      emit(TaskUpdateSuccessState(task: response.data!));
    } else {
      log('2');
      emit(TaskUpdateFailedState());
    }
  }

  changeAssigner(UserEntity user) {
    emit(TaskChangeAssigneer(user: user));
  }

  changeAssignee(UserEntity user) {
    emit(TaskChangeAssignee(user: user));
  }
}
