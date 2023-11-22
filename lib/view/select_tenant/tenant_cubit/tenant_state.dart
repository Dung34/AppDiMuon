part of 'tenant_cubit.dart';

abstract class TenantState extends Equatable {
  const TenantState();

  @override
  List<Object?> get props => [];
}

class TenantInitial extends TenantState {}

class GetAllTenantByUserIdSuccess extends TenantState {
  final List<Tenant>? listTenants;
  const GetAllTenantByUserIdSuccess({required this.listTenants});
  @override
  List<Object?> get props => [];
}

class GetAllTenantByUserIdFailed extends TenantState {}

class GetTenantDetailSuccessState extends TenantState {
  final Tenant tenant;

  const GetTenantDetailSuccessState(this.tenant);
  @override
  List<Object?> get props => [];
}

class GetTenantDetailFailedState extends TenantState {}
