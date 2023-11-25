import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/model/api/base_response.dart';
import '../../../data/repository/remote/tenant_repository.dart';
import '../../../di/di.dart';
import '../../../domain/entity/tenant/claim.dart';
import '../../../domain/entity/tenant/tenant.dart';

part 'tenant_state.dart';

class TenantCubit extends Cubit<TenantState> {
  final TenantRepository _tenantRepository = getIt.get<TenantRepository>();

  TenantCubit() : super(TenantInitial());
  Tenant? tenant;
  List<Tenant> listTenants = [];

  getAllTenant() async {
    final response = await _tenantRepository.getAllTenantByUserId();

    if (response.status == ResponseStatus.success) {
      listTenants.clear();
      listTenants.addAll(response.data ?? []);
      emit(GetAllTenantByUserIdSuccess(listTenants: listTenants));
      log("message");
    } else {
      emit(GetAllTenantByUserIdFailed());
    }
  }

  getPositionForUser(String? userId) async {
    final response = await _tenantRepository.getPositionForUser(userId);

    if (response.status == ResponseStatus.success) {
      emit(GetPositionForUserSuccessState(response.data!));
    } else {
      emit(GetPositionForUserFailedState());
    }
  }

  getTenantDetail() async {
    emit(TenantInitial());

    final response = await _tenantRepository.getTenantDetail();

    if (response.status == ResponseStatus.success) {
      emit(GetTenantDetailSuccessState(response.data!));
    } else {
      emit(GetTenantDetailFailedState());
    }
  }
}
