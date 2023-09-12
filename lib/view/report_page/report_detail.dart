// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../config/routes.dart';
// import '../../domain/entity/report/report_daily.dart';
// import '../../shared/etx/app_ext.dart';
// import '../../shared/utils/date_time_utils.dart';
// import '../../shared/widgets/something/no_data.dart';
// import '../../shared/widgets/something/primary_app_bar.dart';
// import '../base/base_page_sate.dart';
// import '../base/bloc/report/report_cubit.dart';

// class ReportDetailPageArgs extends StatefulWidget {
//   const ReportDetailPageArgs({super.key, String? reportId});

//   @override
//   State<ReportDetailPageArgs> createState() => _ReportDetailPageArgsState();
// }

// class _ReportDetailPageArgsState
//     extends BasePageState<ReportDetailPageArgs, ReportCubit> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }

//   @override
//   Widget buildPage(BuildContext context) {
//     final args = context.arguments as ReportDailyPageArgs;
//     cubit.getReportDetail(args.reportId);
//     return Scaffold(
//       appBar: PrimaryAppBar(
//         title: "Báo cáo hằng ngày",
//         canPop: true,
//       ),
//       body: BlocBuilder<ReportCubit, ReportState>(
//         builder: (context, state) {
//           if (state is GetReportDetailSuccess) {
//             ReportDaily reportDaily = state.reportDaily;
//             return SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     height: 5.0,
//                   ),
//                   Text('Title'),
//                   SizedBox(
//                     height: 5.0,
//                   ),
//                   Card(
//                     borderOnForeground: true,
//                     child: Text(reportDaily.title ?? " "),
//                   ),
//                   SizedBox(
//                     height: 10.0,
//                   ),
//                   const Text('Thời gian'),
//                   Card(
//                       borderOnForeground: true,
//                       child: Text(
//                           DateTimeUtils.formatDate(reportDaily.date ?? " "))),
//                   SizedBox(
//                     height: 6.0,
//                   ),
//                   Card(
//                     borderOnForeground: true,
//                     child: Text(reportDaily.description ?? " "),
//                   )
//                 ],
//               ),
//             );
//           } else {
//             return NoData();
//           }
//         },
//       ),
//     );
//   }
// }
