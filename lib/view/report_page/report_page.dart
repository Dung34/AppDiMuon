import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/routes.dart';
import '../../data/repository/local/local_data_access.dart';
import '../../data/resources/colors.dart';
import '../../data/resources/themes.dart';
import '../../di/di.dart';
import '../../shared/etx/app_ext.dart';
import '../../shared/widgets/button/back_button.dart';
import '../../shared/widgets/list_view/animation_listview.dart';
import '../../shared/widgets/something/no_data.dart';

import '../base/base_page_sate.dart';
import '../base/bloc/report/report_cubit.dart';
import 'report_item.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends BasePageState<ReportPage, ReportCubit> {
  final LocalDataAccess localDataAccess = getIt.get<LocalDataAccess>();
  @override
  void initState() {
    final userId = localDataAccess.getUserId();
    //final userId = '5fcc48c8-0a63-402a-b59f-ca91c8120e5a';
    super.initState();
    cubit.getAllReport(userId);
  }

  final ScrollController scrollController = ScrollController();
  @override
  Widget buildPage(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              top: 20, bottom: 8.0, left: 8.0, right: 8.0),
          child: Row(
            children: [
              BackButtonCustom(),
              Text(
                "Báo cáo hằng ngày",
                style: AppTextTheme.robotoMedium18,
              ),
              SizedBox(width: screenWidth * 4 / 17),
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoute.addReport);
                  },
                  icon: Icon(
                    Icons.add,
                    color: AppColor.fourth700,
                  ))
            ],
          ),
        ),
        Expanded(
            child: BlocBuilder<ReportCubit, ReportState>(
          buildWhen: (previous, current) =>
              current is GetAllReportSuccess || current is ReportInitial,
          builder: (context, state) {
            if (state is GetAllReportSuccess) {
              final listReport = state.listReport;

              final items = List.generate(listReport.length, (index) {
                final reportDaily = listReport[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReportItems(reportDaily: reportDaily),
                    Divider(thickness: 2.0, color: AppColor.fourth300),
                    if (index == listReport.length - 1)
                      const SizedBox(height: 100),
                  ],
                );
              });
              return AnimationStaggeredListView(
                items: items,
                scrollController: scrollController,
                onRefresh: () async {
                  cubit.getAllReport('5fcc48c8-0a63-402a-b59f-ca91c8120e5a');
                },
              );

              // return ListView.builder(
              //   itemCount: listReport.length,
              //   itemBuilder: (context, index) {
              //     return Padding(
              //       padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
              //       child: ListTile(
              //         tileColor: AppColor.fourth200,
              //         title: Text(listReport[index].title ?? ""),
              //         subtitle: Text(DateTimeUtils.formatDate(
              //             listReport[index].date ?? "")),
              //       ),
              //     );
              //   },
              // );
            } else {
              return NoData();
            }
          },
        ))
      ],
    );
  }
}
