import 'package:ceo_hn7/view/base/base_page_sate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/routes.dart';
import '../../data/resources/colors.dart';
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
  late final ReportDailyPageArgs args;
  @override
  bool get useBlocProviderValue => true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    args = context.arguments as ReportDailyPageArgs;
    setCubit = args.reportCubit;

    cubit.getReportDetail(args.reportId);
  }

  @override
  Widget buildPage(BuildContext context) {
    return BlocConsumer<ReportCubit, ReportState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is GetReportDetailSuccess) {
          final report = state.reportDaily;
          return Scaffold(
            backgroundColor: AppColor.primaryBackgroundColor,
            appBar: PrimaryAppBar(
              title: 'Thông tin chi tiết',
            ),
            body: SafeArea(
                child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Tiêu đề'),
                    Text(report.title ?? " "),
                    Text('Thời gian'),
                    Text(DateTimeUtils.formatDate(report.date ?? "")),
                    Text('Mô tả'),
                    Text(report.description ?? " "),
                  ],
                ),
              ),
            )),
          );
        }
        return NoData();
      },
    );
  }
}
