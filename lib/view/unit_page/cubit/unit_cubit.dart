import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repository/remote/okr_repository.dart';
import '../../../domain/entity/okr/unit/unit.dart';
import '../../../data/model/api/base_response.dart';
import '../../../di/di.dart';
import '../../../domain/entity/user/user.dart';

part 'unit_state.dart';

class UnitCubit extends Cubit<UnitState> {
  final OKRRepository _okrRepository = getIt.get<OKRRepository>();

  List<Unit> units = [];
  final List<UserEntity> users = [];

  UnitCubit() : super(UnitInitialState());

  addUsersInUnit(String unitId) async {
    final response = await _okrRepository.addUserInUnit(
        unitId, List.from(users.map((e) => e.id)));

    if (response.status == ResponseStatus.success) {
      emit(UnitAddUsersInUnitSuccessState());
    } else {
      emit(UnitAddUsersInUnitFailedState());
    }
  }

  createUnit(Unit unit) async {
    emit(UnitResetState());
    final response = await _okrRepository.createUnit(unit);

    if (response.status == ResponseStatus.success) {
      emit(UnitCreateUnitSuccessState(response.data!));
    } else {
      emit(UnitCreateUnitFailedState());
    }
  }

  deleteUnit(String id) async {
    final response = await _okrRepository.deleteUnit(id);

    if (response.status == ResponseStatus.success) {
      emit(UnitDeleteUnitSuccessState());
    } else {
      emit(UnitDeleteUnitFailedState());
    }
  }

  getAllUnit() async {
    emit(UnitInitialState());
    final response = await _okrRepository.getAllUnits();

    if (response.status == ResponseStatus.success) {
      units.clear();
      units.addAll(response.data ?? []);
      emit(UnitGetAllUnitSuccessState(units));
    } else {
      emit(UnitGetAllUnitFailedState());
    }
  }

  getAllUser({String? unitId}) async {
    final response =
        await _okrRepository.getAllUsersInUnit(unitId: unitId, page: 1);

    if (response.status == ResponseStatus.success) {
      users.clear();
      users.addAll(response.data ?? []);
      emit(UnitGetAllUserInUnitSuccessState(users));
    } else {
      emit(UnitGetAllUserInUnitFailedState());
    }
  }

  viewUnit(String unitId) async {
    emit(UnitResetState());

    final response = await _okrRepository.viewUnit(unitId);

    if (response.status == ResponseStatus.success) {
      emit(UnitGetUnitDetailSuccessState(response.data!));
    } else {}
  }
}
