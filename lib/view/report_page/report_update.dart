import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/routes.dart';

import '../../data/resources/resources.dart';
import '../../domain/entity/report/report_daily.dart';
import '../../shared/etx/app_ext.dart';
import '../../shared/utils/date_time_utils.dart';
import '../../shared/utils/validation_utils.dart';
import '../../shared/widgets/something/no_data.dart';
import '../../shared/widgets/something/primary_app_bar.dart';
import '../../shared/widgets/text_field/primary_text_field.dart';
import '../base/base_page_sate.dart';
import '../base/bloc/report/report_cubit.dart';

class ReportUpdatePage extends StatefulWidget {
  const ReportUpdatePage({super.key});

  @override
  State<ReportUpdatePage> createState() => _ReportUpdatePageState();
}

class _ReportUpdatePageState
    extends BasePageState<ReportUpdatePage, ReportCubit> {
  @override
  bool get useBlocProviderValue => true;

  late final ReportDaily reportUpdate;
  late ReportDaily reportDaily;
  final TextEditingController titlecontroller = TextEditingController();
  final TextEditingController descriptioncontroller = TextEditingController();
  late final ReportDailyPageArgs args;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
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
          ReportDaily report = state.reportDaily;
          return Scaffold(
            backgroundColor: AppColor.primaryBackgroundColor,
            appBar: PrimaryAppBar(
              canPop: true,
              title: "Chỉnh sửa báo cáo",
              actions: [
                IconButton(
                    onPressed: () {
                      cubit.updateReport(ReportDaily(
                          id: args.reportId,
                          title: titlecontroller.text.trim(),
                          description: descriptioncontroller.text.trim()));
                      context.pop();
                    },
                    icon: SvgPicture.asset(Assets.icEdit))
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Tiêu đề'),
                  PrimaryTextField(
                    borderColor: Colors.black,
                    maxLines: 20,
                    controller: titlecontroller,
                    border: InputBorder.none,
                    hintText: "Thêm tiêu đề",
                    inputTextStyle: AppTextTheme.robotoMedium18,
                    maxLength: 100,
                    hintTextStyle: AppTextTheme.robotoLight18
                        .copyWith(color: AppColor.fourth700),
                    isRequired: true,
                    validator: ValidationUtils.textEmptyValidator,
                  ),
                  Text('Thời gian'),
                  Container(
                      width: 400,
                      padding: const EdgeInsets.only(
                          top: 8.0, bottom: 8.0, left: 8.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all()),
                      child: Text(DateTimeUtils.formatDate(report.date ?? ""),
                          style: AppTextTheme.robotoMedium18)),
                  Text('Mô tả'),
                  PrimaryTextField(
                    borderColor: Colors.black,
                    maxLines: 20,
                    controller: descriptioncontroller,
                    border: InputBorder.none,
                    hintText: "Thêm tiêu đề",
                    inputTextStyle: AppTextTheme.robotoMedium18,
                    maxLength: 100,
                    hintTextStyle: AppTextTheme.robotoLight18
                        .copyWith(color: AppColor.fourth700),
                    isRequired: true,
                    validator: ValidationUtils.textEmptyValidator,
                  ),
                ],
              ),
            ),
          );
        }
        return NoData();
      },
    );
  }
}
