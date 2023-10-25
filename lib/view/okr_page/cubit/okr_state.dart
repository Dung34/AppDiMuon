part of 'okr_cubit.dart';

class OkrState extends Equatable {
  const OkrState();

  @override
  List<Object?> get props => [];
}

class OkrInitial extends OkrState {}

class OkrCreateKeyResultSuccessState extends OkrState {
  final KeyResult keyResult;

  const OkrCreateKeyResultSuccessState(this.keyResult);
  @override
  List<Object?> get props => [];
}

class OkrCreateKeyResultFailedState extends OkrState {}

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

class OkrDeleteKeyResultSuccessState extends OkrState {
  final String id;

  const OkrDeleteKeyResultSuccessState(this.id);
  @override
  List<Object?> get props => [id];
}

class OkrDeleteKeyResultFailedState extends OkrState {}

class OkrDeleteObjectiveSuccessState extends OkrState {}

class OkrDeleteObjectiveFailedState extends OkrState {}

class OkrGetAllKeyResultSuccessState extends OkrState {
  final List<KeyResult>? keyResults;

  const OkrGetAllKeyResultSuccessState(this.keyResults);
  @override
  List<Object?> get props => [keyResults];
}

class OkrGetAllKeyResultFailedState extends OkrState {}

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

class OkrResetState extends OkrState {}

class OkrUpdateKeyResultSuccessState extends OkrState {
  final KeyResult keyResult;

  const OkrUpdateKeyResultSuccessState(this.keyResult);
  @override
  List<Object?> get props => [keyResult];
}

class OkrUpdateKeyResultFailedState extends OkrState {}

class OkrUpdateObjectiveSuccessState extends OkrState {
  final Objective objective;

  const OkrUpdateObjectiveSuccessState(this.objective);
  @override
  List<Object?> get props => [];
}

class OkrUpdateObjectiveFailedState extends OkrState {}
