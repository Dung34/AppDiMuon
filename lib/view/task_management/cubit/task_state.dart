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

class TaskGetAllTaskSuccessState extends TaskState {
  final List<Task> taskList;

  const TaskGetAllTaskSuccessState({required this.taskList});

  @override
  List<Object> get props => [taskList];
}

class TaskGetAllTaskFailedState extends TaskState {}
