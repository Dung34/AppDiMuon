import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../data/model/api/base_response.dart';
import '../../../../data/repository/remote/target_repository.dart';
import '../../../../di/di.dart';
import '../../../../domain/entity/target/target.dart';
import '../../../../shared/utils/view_utils.dart';

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
      // currentTarget = response.data!;
      listTarget.removeWhere((element) => element.id == target.id);
      listTarget.add(response.data!);
      emit(UpdateTargetSuccess(target: response.data!));
      emit(GetAllTargetSuccess(listTarget: listTarget));
      ViewUtils.toastSuccess("Chỉnh sửa mục tiêu thành công");
    } else {
      emit(UpdateTargetFailed());
      ViewUtils.toastWarning("Xảy ra lỗi !!!!");
    }
  }

  addNewTarget(Target target) async {
    final response = await _targetRepository.createTarget(target);
    if (response.status == ResponseStatus.success) {
      listTarget.add(response.data!);

      emit(AddNewTargetSuccess(target: response.data!));
      emit(GetAllTargetSuccess(listTarget: listTarget));
      ViewUtils.toastSuccess("Thêm mục tiêu mới thành công");
    } else {
      emit(AddNewTargetFailed());
      ViewUtils.toastWarning("Xảy ra lỗi !!!!");
    }
  }

  deleteTarget(String id) async {
    final response = await _targetRepository.deleteTarget(id);
    if (response.status == ResponseStatus.success) {
      listTarget.removeWhere((element) => id == id);
      emit(GetAllTargetSuccess(listTarget: listTarget));
      emit(DeleteTargetSuccess(id: id));

      ViewUtils.toastSuccess("Xóa mục tiê thành công");
    } else {
      emit(DeleteTargetFailed());
      ViewUtils.toastWarning("Xảy ra lỗi !!!!");
    }
  }
}
