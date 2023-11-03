import 'package:flutter/material.dart';

import '../../../config/routes.dart';
import '../../../data/repository/local/local_data_access.dart';
import '../../../di/di.dart';
import '../../../domain/entity/tenant/tenant.dart';

class TenantItem extends StatelessWidget {
  final Tenant tenant;
  const TenantItem({
    Key? key,
    required this.tenant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LocalDataAccess localDataAccess = getIt.get<LocalDataAccess>();
    return ListTile(
      onTap: () {
        localDataAccess.setTenantId(tenant.tenantId ?? "");
        Navigator.pushNamed(context, AppRoute.main);
      },
      title: Text(
        tenant.tenantName ?? " ",
      ),
      subtitle: Text(tenant.redirecUrl ?? ""),
    );
  }
}
