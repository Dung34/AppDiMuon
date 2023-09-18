import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/routes.dart';
import '../../data/resources/resources.dart';
import '../../domain/entity/report/report_daily.dart';
import '../../shared/utils/date_time_utils.dart';
import '../base/bloc/report/report_cubit.dart';

class ReportItems extends StatelessWidget {
  final ReportDaily reportDaily;
  final Function()? onPressed;
  const ReportItems({super.key, required this.reportDaily, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => ReportCubit(),
      child: InkWell(
        onTap: onPressed ??
            () {
              Navigator.pushNamed(context, AppRoute.reportDetail,
                  arguments: ReportDailyPageArgs(
                      reportId: reportDaily.id ?? "",
                      reportCubit: context.read<ReportCubit>()));
            },
        child: Row(
          children: [
            SizedBox(
              width: screenWidth * 10 / 16,
              child: Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateTimeUtils.formatDate(reportDaily.date ?? ""),
                      style: AppTextTheme.robotoLight14,
                    ),
                    Text(
                      reportDaily.title ?? " ",
                      style: AppTextTheme.robotoBold18,
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoute.updateReport,
                      arguments: ReportDailyPageArgs(
                          reportId: reportDaily.id ?? " ",
                          reportCubit: context.read<ReportCubit>()));
                },
                icon: SvgPicture.asset(Assets.icEdit)),
            IconButton(
                onPressed: () {
                  ReportCubit().deleteReport(reportDaily.id ?? "");
                },
                icon: SvgPicture.asset(Assets.icDelete))
          ],
        ),
      ),
    );
  }
}
