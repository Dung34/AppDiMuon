// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/routes.dart';
import '../../data/repository/local/local_data_access.dart';
import '../../di/di.dart';
import '../../domain/entity/tenant/tenant.dart';
import '../../shared/widgets/something/no_data.dart';
import '../../shared/widgets/something/primary_app_bar.dart';
import '../base/base_page_sate.dart';
import 'component/tenant_item.dart';
import 'tenant_cubit/tenant_cubit.dart';

class SelectTenant extends StatefulWidget {
  const SelectTenant({super.key});

  @override
  State<SelectTenant> createState() => _SelectTenantState();
}

class _SelectTenantState extends BasePageState<SelectTenant, TenantCubit> {
  @override
  void didChangeDependencies() {
    userCubit.getUser();
    cubit.getAllTenant();
    super.didChangeDependencies();
    listTenants = cubit.listTenants;
    setAppBar = PrimaryAppBar(
      title: "Chọn Công ty",
      canPop: true,
    );
  }

  late List<Tenant> listTenants = [];
  @override
  Widget buildPage(BuildContext context) {
    return BlocConsumer<TenantCubit, TenantState>(
      listener: (context, state) {},
      buildWhen: (previous, current) => current is GetAllTenantByUserIdSuccess,
      builder: (context, state) {
        if (state is GetAllTenantByUserIdSuccess) {
          listTenants = state.listTenants!;
          return SizedBox(
            child: ListView.builder(
                itemBuilder: (context, index) =>
                    TenantItem(tenant: listTenants[index]),
                itemCount: listTenants.length),
          );
        } else {
          return const NoData();
        }
      },
    );
  }
}
