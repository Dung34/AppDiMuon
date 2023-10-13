part of 'okr_cubit.dart';

class OkrState extends Equatable {
  const OkrState();

  @override
  List<Object?> get props => [];
}

class OkrInitial extends OkrState {}

class OkrCreateObjectiveSuccessState extends OkrState {
  final Objective objective;

  const OkrCreateObjectiveSuccessState(this.objective);
  @override
  List<Object?> get props => [objective];
}

class OkrCreateObjectiveFailedState extends OkrState {}

class OkrCreateOkrSuccessState extends OkrState {
  final OKR okr;

  const OkrCreateOkrSuccessState(this.okr);
  @override
  List<Object?> get props => [okr];
}

class OkrCreateOkrFailedState extends OkrState {}

class OkrGetAllObjectivesSuccessState extends OkrState {
  final List<Objective>? objectives;

  const OkrGetAllObjectivesSuccessState(this.objectives);
  @override
  List<Object?> get props => [objectives];
}

class OkrGetAllObjectivesFailedState extends OkrState {}

class OkrGetObjectiveDetailsSuccessState extends OkrState {
  final Objective objective;

  const OkrGetObjectiveDetailsSuccessState(this.objective);
  @override
  List<Object?> get props => [objective];
}

class OkrGetObjectiveDetailsFailedState extends OkrState {}

class OkrGetAllUserSuccessState extends OkrState {
  final List<UserEntity> users;

  const OkrGetAllUserSuccessState(this.users);
}

class OkrGetAllUserFailedState extends OkrState {}

class OkrGetOkrDetailSuccessState extends OkrState {
  final OKR okr;

  const OkrGetOkrDetailSuccessState(this.okr);
  @override
  List<Object?> get props => [okr];
}

class OkrGetOkrDetailFailedState extends OkrState {}
