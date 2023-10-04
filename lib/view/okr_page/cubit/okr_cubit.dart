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

  createObjective({
    String? title,
    String? description,
    required String okrsId,
    required String unitId,
    double? process,
  }) async {
    final response = await _okrRepository.createObjective(
      title: title,
      description: description,
      okrsId: okrsId,
      unitId: unitId,
      process: process,
    );

    if (response.status == ResponseStatus.success) {
      emit(OkrCreateObjectiveSuccessState(response.data!));
    } else {
      emit(OkrCreateObjectiveFailedState());
    }
  }

  createOkr({
    String? name,
    String? description,
    String? unitId,
  }) async {
    final response = await _okrRepository.createOKR(
        name: name, description: description, unitId: unitId);

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
