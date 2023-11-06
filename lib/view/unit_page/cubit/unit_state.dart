part of 'unit_cubit.dart';

abstract class UnitState extends Equatable {
  const UnitState();
  @override
  List<Object?> get props => [];
}

class UnitInitialState extends UnitState {}

class UnitAddUsersInUnitSuccessState extends UnitState {
  final List<UserEntity> members;

  const UnitAddUsersInUnitSuccessState(this.members);
  @override
  List<Object?> get props => [members];
}

class UnitAddUsersInUnitFailedState extends UnitState {}

class UnitCreateUnitSuccessState extends UnitState {
  final Unit unit;

  const UnitCreateUnitSuccessState(this.unit);
  @override
  List<Object?> get props => [unit];
}

class UnitCreateUnitFailedState extends UnitState {}

class UnitDeleteUnitSuccessState extends UnitState {
  final String unitId;

  const UnitDeleteUnitSuccessState(this.unitId);
  @override
  List<Object?> get props => [unitId];
}

class UnitDeleteUnitFailedState extends UnitState {}

class UnitGetAllUnitSuccessState extends UnitState {
  final List<Unit> units;

  const UnitGetAllUnitSuccessState(this.units);
  @override
  List<Object?> get props => [units];
}

class UnitGetAllUnitFailedState extends UnitState {}

class UnitGetUnitDetailSuccessState extends UnitState {
  final Unit unit;

  const UnitGetUnitDetailSuccessState(this.unit);
  @override
  List<Object?> get props => [unit];
}

class UnitGetUnitDetailFailedState extends UnitState {}

class UnitGetAllUserInUnitSuccessState extends UnitState {
  final List<UserEntity> users;

  const UnitGetAllUserInUnitSuccessState(this.users);
  @override
  List<Object?> get props => [users];
}

class UnitGetAllUserInUnitFailedState extends UnitState {}

class UnitResetState extends UnitState {}

class UnitUpdateUnitSuccessState extends UnitState {
  final Unit unit;

  const UnitUpdateUnitSuccessState(this.unit);
  @override
  List<Object?> get props => [unit];
}

class UnitUpdateUnitFailedState extends UnitState {}
