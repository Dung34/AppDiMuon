import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/routes.dart';
import '../../data/resources/colors.dart';
import '../../data/resources/themes.dart';
import '../../domain/entity/taskoverview/general_report.dart';
import '../../shared/etx/app_ext.dart';
import '../../shared/utils/date_time_utils.dart';
import '../../shared/widgets/something/no_data.dart';
import '../../shared/widgets/something/primary_app_bar.dart';
import '../base/base_page_sate.dart';
import '../base/bloc/general_report/general_report_cubit.dart';

class GeneReportDetail extends StatefulWidget {
  const GeneReportDetail({super.key});

  @override
  State<GeneReportDetail> createState() => _GeneReportDetailState();
}

class _GeneReportDetailState
    extends BasePageState<GeneReportDetail, GeneralReportCubit> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    args = context.arguments as GeneralReportArgs;
    setCubit = args.generalReportCubit;
    cubit.getGeneralReportDetail(args.reportId);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  // TODO: implement useBlocProviderValue
  bool get useBlocProviderValue => true;

  late final GeneralReportArgs args;

  @override
  Widget buildPage(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return BlocConsumer<GeneralReportCubit, GeneralReportState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is GetGeneralReportSuccess) {
          GeneralReport generalReport = state.generalReport;
          return Scaffold(
            backgroundColor: AppColor.primaryBackgroundColor,
            appBar: PrimaryAppBar(title: "Báo cáo tổng quan"),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    child: Text(
                      'Tiêu đề',
                    ),
                  ),
                  Container(
                    width: screenWidth * 15 / 16,
                    padding: const EdgeInsets.all(8.0),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(width: 2),
                            borderRadius: BorderRadius.circular(16.0))),
                    child: Text(
                      generalReport.title ?? " ",
                      style: AppTextTheme.robotoLight18,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  const SizedBox(
                    child: Text(
                      'Từ ngày',
                    ),
                  ),
                  Container(
                    width: screenWidth * 15 / 16,
                    padding: const EdgeInsets.all(8.0),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(width: 2),
                            borderRadius: BorderRadius.circular(16.0))),
                    child: Text(
                      DateTimeUtils.formatDate(generalReport.dateFrom ?? ""),
                      style: AppTextTheme.robotoLight18,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  const SizedBox(
                    child: Text(
                      'Đến ngày',
                    ),
                  ),
                  Container(
                    width: screenWidth * 15 / 16,
                    padding: const EdgeInsets.all(8.0),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(width: 2),
                            borderRadius: BorderRadius.circular(16.0))),
                    child: Text(
                      DateTimeUtils.formatDate(generalReport.dateTo ?? ""),
                      style: AppTextTheme.robotoLight18,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  const SizedBox(
                    child: Text(
                      'Đã làm',
                    ),
                  ),
                  Container(
                    width: screenWidth * 15 / 16,
                    padding: const EdgeInsets.all(8.0),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(width: 2),
                            borderRadius: BorderRadius.circular(16.0))),
                    child: Text(
                      generalReport.workDone ?? " ",
                      style: AppTextTheme.robotoLight18,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  const SizedBox(
                    child: Text(
                      'Vấn đề',
                    ),
                  ),
                  Container(
                    width: screenWidth * 15 / 16,
                    padding: const EdgeInsets.all(8.0),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(width: 2),
                            borderRadius: BorderRadius.circular(16.0))),
                    child: Text(
                      generalReport.issue ?? " ",
                      style: AppTextTheme.robotoLight18,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  const SizedBox(
                    child: Text(
                      'Thêm',
                    ),
                  ),
                  Container(
                    width: screenWidth * 15 / 16,
                    padding: const EdgeInsets.all(8.0),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(width: 2),
                            borderRadius: BorderRadius.circular(16.0))),
                    child: Text(
                      generalReport.add ?? " ",
                      style: AppTextTheme.robotoLight18,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  const SizedBox(
                    child: Text(
                      'Mô tả',
                    ),
                  ),
                  Container(
                    width: screenWidth * 15 / 16,
                    padding: const EdgeInsets.all(8.0),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(width: 2),
                            borderRadius: BorderRadius.circular(16.0))),
                    child: Text(
                      generalReport.description ?? " ",
                      style: AppTextTheme.robotoLight18,
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return const NoData();
      },
    );
  }
}
