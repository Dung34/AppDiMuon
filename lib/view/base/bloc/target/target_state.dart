part of 'target_cubit.dart';

abstract class TargetState extends Equatable {
  const TargetState();

  @override
  List<Object> get props => [];
}

class TargetInitial extends TargetState {}

class GetAllTargetSuccess extends TargetState {
  final List<Target> listTarget;
  const GetAllTargetSuccess({required this.listTarget});
  @override
  List<Target> get props => [];
}

class GetAllTargetFailed extends TargetState {}

class GetDetailTargetSuccess extends TargetState {
  final Target target;
  const GetDetailTargetSuccess({required this.target});

  @override
  List<Target> get props => [];
}

class GetDetailTargetFailed extends TargetState {}

class UpdateTargetSuccess extends TargetState {
  final Target target;
  const UpdateTargetSuccess({required this.target});

  @override
  List<Target> get props => [];
}

class UpdateTargetFailed extends TargetState {}

class DeleteTargetSuccess extends TargetState {}

class DeleteTargetFailed extends TargetState {}

class AddNewTargetSuccess extends TargetState {}

class AddNewTargetFailed extends TargetState {}
