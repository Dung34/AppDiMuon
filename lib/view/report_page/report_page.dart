import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repository/local/local_data_access.dart';
import '../../data/resources/colors.dart';
import '../../data/resources/themes.dart';
import '../../di/di.dart';
import '../base/base_page_sate.dart';
import '../base/bloc/report/report_cubit.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends BasePageState<ReportPage, ReportCubit> {
  final LocalDataAccess localDataAccess = getIt.get<LocalDataAccess>();
  @override
  void initState() {
    //final userId = localDataAccess.getUserId();
    final userId = '5fcc48c8-0a63-402a-b59f-ca91c8120e5a';
    super.initState();
    cubit.getAllReport(userId);
  }

  @override
  Widget buildPage(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(top: 20, left: 8.0, right: 8, bottom: 8.0),
          child: Text(
            'Báo cáo hằng ngày',
            style: AppTextTheme.textAppBarPrimary
                .copyWith(color: AppColor.black, fontSize: 24),
          ),
        ),
        Expanded(child: BlocBuilder(
          builder: (context, state) {
            if (state is GetAllReportSuccess) {
              final listReport = state.listReport;
              return ListView.builder(
                itemCount: listReport.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: ListTile(
                      tileColor: AppColor.fourth200,
                      title: Text(listReport[index].title ?? ""),
                      subtitle: Text(listReport[index].description ?? ""),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: Text(
                  "Không có dữ liệu",
                  style: AppTextTheme.textPrimaryMedium,
                ),
              );
            }
          },
        ))
      ],
    );
  }
}
