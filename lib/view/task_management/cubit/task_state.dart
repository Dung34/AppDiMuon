part of 'task_cubit.dart';

class TaskState {
  const TaskState();

  @override
  List<Object> get props => [];
}

class TaskInitial extends TaskState {}

class TaskGetAllTaskSuccessState extends TaskState {
  final List<Task> taskList;

  const TaskGetAllTaskSuccessState({required this.taskList});

  @override
  List<Object> get props => [taskList];
}

class TaskGetAllTaskFailedState extends TaskState {}
