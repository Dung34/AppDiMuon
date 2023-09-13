import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/resources/resources.dart';
import '../../domain/entity/taskoverview/general_report.dart';
import '../../shared/utils/date_time_utils.dart';
import '../base/bloc/general_report/general_report_cubit.dart';

class GeneralReportItem extends StatelessWidget {
  final GeneralReport generalReport;
  const GeneralReportItem({super.key, required this.generalReport});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GeneralReportCubit(),
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            SizedBox(
              width: 270,
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
            IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
            IconButton(onPressed: () {}, icon: Icon(Icons.delete))
          ],
        ),
      ),
    );
  }
}
