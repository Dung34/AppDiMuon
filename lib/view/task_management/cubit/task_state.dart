part of 'task_cubit.dart';

class TaskState {
  const TaskState();

  @override
  List<Object> get props => [];
}

class TaskInitial extends TaskState {}

class TaskCreateSuccessState extends TaskState {
  final Task task;

  TaskCreateSuccessState({required this.task});
}

class TaskCreateFailedState extends TaskState {}

class TaskGetDetailSuccessState extends TaskState {
  final Task task;

  TaskGetDetailSuccessState({required this.task});
}

class TaskGetDetailFailedState extends TaskState {}

class TaskUpdateSuccessState extends TaskState {
  final Task task;

  TaskUpdateSuccessState({required this.task});
}

class TaskUpdateFailedState extends TaskState {}

class TaskDeleteSuccessState extends TaskState {
  final Task task;

  TaskDeleteSuccessState({required this.task});
}

class TaskDeleteFailedState extends TaskState {}

class TaskGetAllTaskSuccessState extends TaskState {
  final List<Task> taskList;

  const TaskGetAllTaskSuccessState({required this.taskList});

  @override
  List<Object> get props => [taskList];
}

class TaskGetAllTaskFailedState extends TaskState {}

class TaskChangeAssignee extends TaskState {
  final UserEntity user;

  TaskChangeAssignee({required this.user});
}

class TaskChangeAssigneer extends TaskState {
  final UserEntity user;

  TaskChangeAssigneer({required this.user});
}
