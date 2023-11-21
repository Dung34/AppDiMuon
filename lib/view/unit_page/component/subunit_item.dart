import 'package:flutter/material.dart';

import '../../../config/routes.dart';
import '../../../data/resources/resources.dart';
import '../../../domain/entity/okr/unit/unit.dart';
import '../../../shared/utils/date_time_utils.dart';

class SubUnitItem extends StatelessWidget {
  final Unit unit;
  final bool isAdmin;

  const SubUnitItem({super.key, required this.unit, required this.isAdmin});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoute.unitDetail,
            arguments: UnitDetailPageArgs(
                unit: unit, isAdmin: isAdmin, parrentName: unit.name));
      },
      child: Container(
        decoration: const BoxDecoration(
            border:
                Border(bottom: BorderSide(color: AppColor.gray200, width: 0.5)),
            color: AppColor.white),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('${unit.name}',
              style:
                  AppTextTheme.lexendBold16.copyWith(color: AppColor.darkGray)),
          const SizedBox(height: 6),
          Row(
            children: [
              const Expanded(
                flex: 107,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Owner', style: AppTextTheme.lexendLight14),
                    SizedBox(height: 6),
                    Text('Due Date', style: AppTextTheme.lexendLight14),
                    SizedBox(height: 6),
                    Text('Target', style: AppTextTheme.lexendLight14)
                  ],
                ),
              ),
              Expanded(
                flex: 289,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${unit.owner}', style: AppTextTheme.lexendRegular14),
                    const SizedBox(height: 6),
                    Text(DateTimeUtils.formatDate(unit.startDate ?? ''),
                        style: AppTextTheme.lexendRegular14),
                    const SizedBox(height: 6),
                    Text('0/0', style: AppTextTheme.lexendRegular14)
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 12)
        ]),
      ),
    );
  }
}
