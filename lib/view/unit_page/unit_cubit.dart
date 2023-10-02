import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/api/base_response.dart';
import '../../data/repository/remote/okr_repository.dart';
import '../../di/di.dart';
import '../../domain/entity/okr/unit/unit.dart';

part 'unit_state.dart';

class UnitCubit extends Cubit<UnitState> {
  final OKRRepository _okrRepository = getIt.get<OKRRepository>();

  final List<Unit> units = [];

  UnitCubit() : super(UnitInitialState());

  createUnit(
      {String? name,
      String? parrentId,
      String? description,
      String? coverImage}) async {
    final response = await _okrRepository.createUnit(
        name: name,
        parrentId: parrentId,
        description: description,
        coverImage: coverImage);

    if (response.status == ResponseStatus.success) {
      emit(UnitCreateUnitSuccessState(response.data!));
    } else {
      emit(UnitCreateUnitFailedState());
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

  viewUnit(String unitId) async {
    final response = await _okrRepository.viewUnit(unitId);

    if (response.status == ResponseStatus.success) {
      emit(UnitGetUnitDetailSuccessState(response.data!));
    } else {}
  }
}
