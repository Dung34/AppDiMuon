import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/routes.dart';
import '../../data/resources/resources.dart';
import '../../domain/entity/taskoverview/general_report.dart';
import '../../shared/utils/date_time_utils.dart';
import '../base/bloc/general_report/general_report_cubit.dart';

class GeneralReportItem extends StatelessWidget {
  final GeneralReport generalReport;
  const GeneralReportItem({super.key, required this.generalReport});
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => GeneralReportCubit(),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, AppRoute.geneReportDetail,
              arguments: GeneralReportArgs(
                  reportId: generalReport.id ?? "",
                  generalReportCubit: context.read<GeneralReportCubit>()));
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
                      DateTimeUtils.formatDate(generalReport.dateFrom ?? ""),
                      style: AppTextTheme.robotoLight14,
                    ),
                    Text(
                      generalReport.title ?? " ",
                      style: AppTextTheme.robotoBold18,
                    )
                  ],
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoute.geneReportUpdate,
                      arguments: GeneralReportArgs(
                          reportId: generalReport.id ?? " ",
                          generalReportCubit:
                              context.read<GeneralReportCubit>()));
                },
                icon: SvgPicture.asset(Assets.icEdit)),
            IconButton(
                onPressed: () {
                  GeneralReportCubit().deleteGeneralReport(generalReport.id!);
                },
                icon: SvgPicture.asset(Assets.icDelete))
          ],
        ),
      ),
    );
  }
}
