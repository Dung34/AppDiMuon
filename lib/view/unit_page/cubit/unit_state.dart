part of 'unit_cubit.dart';

abstract class UnitState extends Equatable {
  const UnitState();
  @override
  List<Object?> get props => [];
}

class UnitInitialState extends UnitState {}

class UnitCreateUnitSuccessState extends UnitState {
  final Unit unit;

  const UnitCreateUnitSuccessState(this.unit);
  @override
  List<Object?> get props => [unit];
}

class UnitCreateUnitFailedState extends UnitState {}

class UnitDeleteUnitSuccessState extends UnitState {}

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
