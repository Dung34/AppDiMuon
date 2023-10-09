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
