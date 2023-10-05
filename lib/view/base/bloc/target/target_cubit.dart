import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../data/model/api/base_response.dart';
import '../../../../data/repository/remote/target_repository.dart';
import '../../../../di/di.dart';
import '../../../../domain/entity/target/target.dart';

part 'target_state.dart';

class TargetCubit extends Cubit<TargetState> {
  TargetCubit() : super(TargetInitial());
  final TargetRepository _targetRepository = getIt.get<TargetRepository>();

  Target? currentTarget;
  List<Target> listTarget = [];
  getAllTarget() async {
    final response = await _targetRepository.getAllTarget();
    if (response.status == ResponseStatus.success) {
      listTarget.clear();
      listTarget.addAll(response.data ?? []);
      emit(TargetInitial());
      emit(GetAllTargetSuccess(listTarget: listTarget));
    } else {
      emit(GetAllTargetFailed());
    }
  }

  getDetailTarget(String id) async {
    final response = await _targetRepository.getDeteilTarget(id);
    if (response.status == ResponseStatus.success) {
      currentTarget = response.data!;
      emit(TargetInitial());
      emit(GetDetailTargetSuccess(target: response.data!));
    } else {
      emit(GetDetailTargetFailed());
    }
  }

  addTarget(Target target) async {
    final response = await _targetRepository.createTarget(target);
    if (response.status == ResponseStatus.success) {
      listTarget.add(target);
      emit(TargetInitial());
      emit(AddNewTargetSuccess());
    } else {
      emit(AddNewTargetSuccess());
    }
  }

  updateTarget(Target target) async {
    final response = await _targetRepository.updateTarget(target);
    if (response.status == ResponseStatus.success) {
      currentTarget = response.data!;
      emit(TargetInitial());
      emit(UpdateTargetSuccess(target: currentTarget!));
    } else {
      emit(UpdateTargetFailed());
    }
  }

  deleteTarget(String id) async {
    final response = await _targetRepository.deleteTarget(id);
    if (response.status == ResponseStatus.success) {
      listTarget.removeWhere((element) => element.id == id);
      emit(DeleteTargetSuccess());
      emit(GetAllTargetSuccess(listTarget: listTarget));
    } else {
      emit(DeleteTargetFailed());
    }
  }
}
