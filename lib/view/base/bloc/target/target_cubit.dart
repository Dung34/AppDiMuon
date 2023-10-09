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
}
