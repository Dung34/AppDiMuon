import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../data/model/api/base_response.dart';
import '../../../../data/repository/remote/target_repository.dart';
import '../../../../di/di.dart';
import '../../../../domain/entity/target/target.dart';

part 'target_state.dart';

class TargetCubit extends Cubit<TargetState> {
  final TargetRepository _targetRepository = getIt.get<TargetRepository>();
  TargetCubit() : super(TargetInitial());
  Target? currentTarget;
  List<Target> listTarget = [];
  getAllTarget() async {
    final response = await _targetRepository.getAllTarget();
    if (response.status == ResponseStatus.success) {
      listTarget.clear();
      listTarget.addAll(response.data ?? []);
      emit(GetAllTargetSuccess(listTarget: listTarget));
    } else {
      emit(GetAllTargetFailed());
    }
  }

  getDetailTarget(String id) async {
    final response = await _targetRepository.getDeteilTarget(id);
    if (response.status == ResponseStatus.success) {
      currentTarget = response.data!;
      emit(GetDetailTargetSuccess(target: response.data!));
    } else {
      emit(GetDetailTargetFailed());
    }
  }

  updateTarget(Target target) async {
    final response = await _targetRepository.updateTarget(target);
    if (response.status == ResponseStatus.success) {
      currentTarget = response.data!;
      emit(UpdateTargetSuccess(target: response.data!));
    } else {
      emit(UpdateTargetFailed());
    }
  }

  addNewTarget(Target target) async {
    final response = await _targetRepository.createTarget(target);
    if (response.status == ResponseStatus.success) {
      listTarget.add(target);
      emit(GetAllTargetSuccess(listTarget: listTarget));
      emit(AddNewTargetSuccess());
    } else {
      emit(AddNewTargetFailed());
    }
  }

  deleteTarget(String id) async {
    final response = await _targetRepository.deleteTarget(id);
    if (response.status == ResponseStatus.success) {
      listTarget.removeWhere((element) => id == id);
      emit(GetAllTargetSuccess(listTarget: listTarget));
      emit(DeleteTargetSuccess());
    } else {
      emit(DeleteTargetFailed());
    }
  }

  getReset() {
    emit(GetAllTargetSuccess(listTarget: listTarget));
  }
}
