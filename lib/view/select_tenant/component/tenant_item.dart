import 'package:flutter/material.dart';

import '../../../config/routes.dart';
import '../../../data/repository/local/local_data_access.dart';
import '../../../data/resources/resources.dart';
import '../../../di/di.dart';
import '../../../domain/entity/tenant/tenant.dart';
import '../../../shared/widgets/container/primary_container.dart';

class TenantItem extends StatelessWidget {
  final Tenant tenant;
  const TenantItem({
    Key? key,
    required this.tenant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LocalDataAccess localDataAccess = getIt.get<LocalDataAccess>();
    return Column(
      children: [
        PrimaryContainer(
          boxShadow: [
            BoxShadow(
                blurRadius: 15,
                color: Colors.black.withOpacity(0.1),
                offset: const Offset(1, 1),
                spreadRadius: 1)
          ],
          child: ListTile(
            onTap: () {
              debugPrint(tenant.tenantId);
              localDataAccess.setTenantId(tenant.tenantId ?? '');
              Navigator.pushNamedAndRemoveUntil(
                  context, AppRoute.main, ((route) => false));
            },
            title: Text(
              tenant.tenantName ?? " ",
              style: AppTextTheme.lexendBold24,
            ),
            subtitle: Text(tenant.redirecUrl ?? ""),
          ),
        ),
        const SizedBox(height: 15)
      ],
    );
  }
}
