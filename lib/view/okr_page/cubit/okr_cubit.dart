import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/model/api/base_response.dart';
import '../../../data/repository/remote/okr_repository.dart';
import '../../../di/di.dart';
import '../../../domain/entity/okr/key_result/key_result.dart';
import '../../../domain/entity/okr/objective/objective.dart';
import '../../../domain/entity/okr/okr_wrapper/okr.dart';
import '../../../domain/entity/user/user.dart';

part 'okr_state.dart';

class OkrCubit extends Cubit<OkrState> {
  final OKRRepository _okrRepository = getIt.get<OKRRepository>();

  OkrCubit() : super(OkrInitial());

  createKeyResult(KeyResult keyResult) async {
    final response = await _okrRepository.createKeyResult(keyResult);

    if (response.status == ResponseStatus.success) {
      emit(OkrCreateKeyResultSuccessState(response.data!));
    } else {
      emit(OkrCreateKeyResultFailedState());
    }
  }

  createObjective(Objective objective, List<String> related) async {
    final response = await _okrRepository.createObjective(objective, related);

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

  deleteKeyResult(String id) async {
    emit(OkrResetState());

    final response = await _okrRepository.deleteKeyResult(id);

    if (response.status == ResponseStatus.success) {
      emit(OkrDeleteKeyResultSuccessState(id));
    } else {
      emit(OkrDeleteKeyResultFailedState());
    }
  }

  deleteObjective(String id) async {
    final response = await _okrRepository.deleteObjective(id);

    if (response.status == ResponseStatus.success) {
      emit(OkrDeleteObjectiveSuccessState());
    } else {
      emit(OkrDeleteObjectiveFailedState());
    }
  }

  getAllObjectives({String? okrId, String? unitId}) async {
    emit(OkrInitial());

    final response =
        await _okrRepository.getAllObjective(okrId: okrId, unitId: unitId);

    if (response.status == ResponseStatus.success) {
      emit(OkrGetAllObjectivesSuccessState(response.data));
    } else {
      emit(OkrGetAllObjectivesFailedState());
    }
  }

  getObjectiveDetails(String objectiveId) async {
    final response = await _okrRepository.getObjectiveDetails(objectiveId);

    if (response.status == ResponseStatus.success) {
      emit(OkrGetObjectiveDetailsSuccessState(response.data!));
    } else {
      emit(OkrGetObjectiveDetailsFailedState());
    }
  }

  getAllUsers({String? unitId, required int page, int pageSize = 10}) async {
    final response = await _okrRepository.getAllUsersInUnit(
      unitId: unitId,
      page: page,
      pageSize: pageSize,
    );

    if (response.status == ResponseStatus.success) {
      emit(OkrGetAllUserSuccessState(response.data ?? []));
    } else {
      emit(OkrGetAllUserFailedState());
    }
  }

  createOKR(OKR okr) async {
    final response = await _okrRepository.createOKR(okr);

    if (response.status == ResponseStatus.success) {
      emit(OkrCreateOkrSuccessState(response.data!));
    } else {
      emit(OkrCreateOkrFailedState());
    }
  }

  getAllKeyResult(String objectiveId) async {
    final response = await _okrRepository.getAllKeyResult(objectiveId);

    if (response.status == ResponseStatus.success) {
      emit(OkrGetAllKeyResultSuccessState(response.data));
    } else {
      emit(OkrGetAllKeyResultFailedState());
    }
  }

  getOKRDetail({String? okrId, String? unitId}) async {
    emit(OkrInitial());

    final response =
        await _okrRepository.getOKRDetail(okrId: okrId, unitId: unitId);

    if (response.status == ResponseStatus.success) {
      emit(OkrGetOkrDetailSuccessState(response.data!));
    } else {
      emit(OkrGetOkrDetailFailedState());
    }
  }

  updateKeyResult(KeyResult keyResult) async {
    final response = await _okrRepository.updateKeyResult(keyResult);

    if (response.status == ResponseStatus.success) {
      emit(OkrUpdateKeyResultSuccessState(keyResult));
    } else {
      emit(state);
    }
  }

  updateObjective(Objective objective) async {
    final response = await _okrRepository.updateObjective(objective);

    if (response.status == ResponseStatus.success) {
      emit(OkrUpdateObjectiveSuccessState(response.data!));
    } else {
      emit(OkrUpdateObjectiveFailedState());
    }
  }
}
