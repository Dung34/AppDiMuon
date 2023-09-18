import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/routes.dart';
import '../../data/repository/local/local_data_access.dart';
import '../../data/resources/resources.dart';
import '../../di/di.dart';
import '../../shared/widgets/button/back_button.dart';
import '../../shared/widgets/list_view/animation_listview.dart';
import '../../shared/widgets/something/no_data.dart';
import '../base/base_page_sate.dart';
import '../base/bloc/general_report/general_report_cubit.dart';
import 'general_report_item.dart';

class GeneralPage extends StatefulWidget {
  const GeneralPage({super.key});

  @override
  State<GeneralPage> createState() => _GeneralPageState();
}

class _GeneralPageState extends BasePageState<GeneralPage, GeneralReportCubit> {
  final LocalDataAccess localDataAccess = getIt.get<LocalDataAccess>();
  @override
  void initState() {
    final userId = localDataAccess.getUserId();
    //final String userId = "5fcc48c8-0a63-402a-b59f-ca91c8120e5a";
    super.initState();
    cubit.getAllGeneralReport(userId);
  }

  final ScrollController scrollController = ScrollController();
  @override
  Widget buildPage(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20, bottom: 8.0, left: 8.0, right: 8.0),
          child: Row(
            children: [
              const BackButtonCustom(),
              SizedBox(
                width: screenWidth * 10 / 16,
                child: const Text(
                  "  Báo cáo tổng quan",
                  style: AppTextTheme.lexendBold16,
                ),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoute.geneReportAdd);
                  },
                  icon: SvgPicture.asset(Assets.icAdd))
            ],
          ),
        ),
        Expanded(
            child: BlocBuilder<GeneralReportCubit, GeneralReportState>(
          buildWhen: (previous, current) =>
              current is GetAllGeneralReportSuccess ||
              current is GeneralReportInitial,
          builder: (context, state) {
            if (state is GetAllGeneralReportSuccess) {
              final reports = state.reports;

              final items = List.generate(reports.length, (index) {
                final generalReport = reports[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GeneralReportItem(generalReport: generalReport),
                    Divider(
                      thickness: 2.0,
                      color: AppColor.fourth300,
                    ),
                    if (index == reports.length - 1)
                      const SizedBox(height: 100),
                  ],
                );
              });
              return AnimationStaggeredListView(
                items: items,
                scrollController: scrollController,
                onRefresh: () async {
                  cubit.getAllGeneralReport(
                      '5fcc48c8-0a63-402a-b59f-ca91c8120e5a');
                },
              );
            } else {
              return const NoData();
            }
          },
        ))
      ],
    );
  }
}
