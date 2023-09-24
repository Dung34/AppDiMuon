part of 'project_cubit.dart';

abstract class ProjectState extends Equatable {
  const ProjectState();
  @override
  List<Object?> get props => [];
}

class EventInitial extends ProjectState {}

class EventGetAllProjectSuccessState extends ProjectState {
  final List<Project> projects;

  const EventGetAllProjectSuccessState(this.projects);
  @override
  List<Object?> get props => [projects];
}

class EventGetAllProjectFailedState extends ProjectState {}

class EventGetProjectByIdSuccessState extends ProjectState {
  final Project project;

  const EventGetProjectByIdSuccessState(this.project);

  @override
  List<Object?> get props => [project];
}

class EventGetProjectByIdFailedState extends ProjectState {}

class EventResetState extends ProjectState {}
