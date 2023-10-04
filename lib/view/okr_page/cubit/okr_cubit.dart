import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/model/api/base_response.dart';
import '../../../data/repository/remote/okr_repository.dart';
import '../../../di/di.dart';
import '../../../domain/entity/okr/objective/objective.dart';
import '../../../domain/entity/okr/okr_wrapper/okr.dart';

part 'okr_state.dart';

class OkrCubit extends Cubit<OkrState> {
  final OKRRepository _okrRepository = getIt.get<OKRRepository>();

  OkrCubit() : super(OkrInitial());

  createObjective(Objective objective) async {
    final response = await _okrRepository.createObjective(objective);

    if (response.status == ResponseStatus.success) {
      emit(OkrCreateObjectiveSuccessState(response.data!));
    } else {
      emit(OkrCreateObjectiveFailedState());
    }
  }

  createOkr(OKR okr) async {
    final response = await _okrRepository.createOKR(okr);

    if (response.status == ResponseStatus.success) {
      emit(OkrCreateOkrSuccessState(response.data!));
    } else {
      emit(OkrCreateOkrFailedState());
    }
  }

  getAllObjectives({String? okrId, String? unitId}) async {
    final response =
        await _okrRepository.getAllObjective(okrId: okrId, unitId: unitId);

    if (response.status == ResponseStatus.success) {
      emit(OkrGetAllObjectivesOfOkrSuccessState(response.data));
    } else {
      emit(OkrGetAllObjectivesOfOkrFailedState());
    }
  }

  getObjectiveDetails(String objectiveId, String unitId) async {
    final response =
        await _okrRepository.getObjectiveDetails(objectiveId, unitId);

    if (response.status == ResponseStatus.success) {
      emit(OkrGetObjectiveDetailsSuccessState(response.data!));
    } else {
      emit(OkrGetObjectiveDetailsFailedState());
    }
  }
}
