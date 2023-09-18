// ignore: prefer_relative_imports
import 'package:ceo_hn7/view/base/base_page_sate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/routes.dart';
import '../../data/resources/resources.dart';
import '../../domain/entity/report/report_daily.dart';
import '../../shared/etx/app_ext.dart';
import '../../shared/utils/date_time_utils.dart';
import '../../shared/widgets/something/no_data.dart';
import '../../shared/widgets/something/primary_app_bar.dart';
import '../base/bloc/report/report_cubit.dart';

class ReportDetailView extends StatefulWidget {
  const ReportDetailView({super.key});

  @override
  State<ReportDetailView> createState() => _ReportDetailViewState();
}

class _ReportDetailViewState
    extends BasePageState<ReportDetailView, ReportCubit> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  // TODO: implement useBlocProviderValue
  bool get useBlocProviderValue => true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    args = context.arguments as ReportDailyPageArgs;
    setCubit = args.reportCubit;
    cubit.getReportDetail(args.reportId);
  }

  late final ReportDailyPageArgs args;
  @override
  Widget buildPage(BuildContext context) {
    return BlocConsumer<ReportCubit, ReportState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is GetReportDetailSuccess) {
          ReportDaily report = state.reportDaily;
          return Scaffold(
            backgroundColor: AppColor.primaryBackgroundColor,
            appBar: PrimaryAppBar(
              title: 'Thông tin chi tiết',
            ),
            body: SafeArea(
                child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Tiêu đề'),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 400,
                      padding: const EdgeInsets.only(
                          top: 8.0, bottom: 8.0, left: 8.0),
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(16)),
                      child: Text(report.title ?? "",
                          style: AppTextTheme.robotoMedium18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Thời gian'),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                        width: 400,
                        padding: const EdgeInsets.only(
                            top: 8.0, bottom: 8.0, left: 8.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all()),
                        child: Text(DateTimeUtils.formatDate(report.date ?? ""),
                            style: AppTextTheme.robotoMedium18)),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Mô tả'),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                        width: 400,
                        padding: const EdgeInsets.only(
                            top: 8.0, bottom: 8.0, left: 8.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all()),
                        child: Text(report.description ?? "",
                            style: AppTextTheme.robotoMedium18)),
                  ],
                ),
              ),
            )),
          );
        }
        return const NoData();
      },
    );
  }
}
