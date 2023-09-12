import 'package:flutter/material.dart';

import '../../config/routes.dart';
import '../../data/resources/colors.dart';
import '../../data/resources/themes.dart';
import '../../domain/entity/report/report_daily.dart';
import '../../shared/utils/date_time_utils.dart';
import 'report_detail.dart';

class ReportItems extends StatelessWidget {
  final ReportDaily reportDaily;
  final Function()? onPressed;
  const ReportItems({super.key, required this.reportDaily, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed ??
          () {
            Navigator.pushNamed(context, AppRoute.reportDetail,
                arguments: ReportDetailPageArgs());
          },
      child: Padding(
        padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateTimeUtils.formatDate(reportDaily.date ?? ""),
              style: AppTextTheme.robotoLight14
                  .copyWith(color: AppColor.black, fontSize: 12),
            ),
            Text(
              reportDaily.title ?? " ",
              style: AppTextTheme.textAppBarPrimary
                  .copyWith(color: AppColor.black, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
