import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/routes.dart';
import '../../data/resources/resources.dart';
import '../../domain/entity/taskoverview/general_report.dart';
import '../../shared/etx/app_ext.dart';
import '../../shared/utils/validation_utils.dart';
import '../../shared/widgets/button/back_button.dart';

import '../../shared/widgets/text_field/primary_text_field.dart';
import '../base/base_page_sate.dart';
import '../base/bloc/general_report/general_report_cubit.dart';

class GenReportUpdate extends StatefulWidget {
  const GenReportUpdate({super.key});

  @override
  State<GenReportUpdate> createState() => _GenReportUpdateState();
}

class _GenReportUpdateState
    extends BasePageState<GenReportUpdate, GeneralReportCubit> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController workdoneController = TextEditingController();
  final TextEditingController issueController = TextEditingController();
  final TextEditingController addControoler = TextEditingController();
  late final GeneralReportArgs args;
  late final GeneralReport updateReport;
  late GeneralReport currentReport;
  @override
  // TODO: implement useBlocProviderValue
  bool get useBlocProviderValue => true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    args = context.arguments as GeneralReportArgs;
    setCubit = args.generalReportCubit;
    cubit.getGeneralReportDetail(args.reportId);
    currentReport = cubit.currentGeneralReport!;
    updateReport = currentReport.copyWith();
  }

  @override
  Widget buildPage(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                BackButtonCustom(),
                SizedBox(
                  width: screenWidth * 9 / 16,
                  child: Text(
                    'Báo cáo tổng quát',
                    style: AppTextTheme.robotoLight18,
                  ),
                ),
                IconButton(
                    onPressed: () {}, icon: SvgPicture.asset(Assets.icAdd))
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: PrimaryTextField(
                controller: titleController,
                label: "Tiêu đề",
                hintText: "Nhập tiêu đề",
                isRequired: true,
                maxLength: 200,
                validator: ValidationUtils.textEmptyValidator,
                inputTextStyle: AppTextTheme.robotoLight18,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: PrimaryTextField(
                controller: workdoneController,
                label: "Đã làm",
                hintText: "Nhập đã làm",
                isRequired: true,
                maxLength: 200,
                validator: ValidationUtils.textEmptyValidator,
                inputTextStyle: AppTextTheme.robotoLight18,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: PrimaryTextField(
                controller: issueController,
                label: "Vấn đề",
                hintText: "Nhập vấn đề",
                isRequired: true,
                maxLength: 200,
                validator: ValidationUtils.textEmptyValidator,
                inputTextStyle: AppTextTheme.robotoLight18,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: PrimaryTextField(
                controller: titleController,
                label: "Thêm",
                // hintText: "Nhập tiêu đề",
                isRequired: true,
                maxLength: 200,
                validator: ValidationUtils.textEmptyValidator,
                inputTextStyle: AppTextTheme.robotoLight18,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: PrimaryTextField(
                controller: descriptionController,
                label: "Mô tả",
                hintText: "Nhập mô tả",
                isRequired: true,
                maxLength: 200,
                validator: ValidationUtils.textEmptyValidator,
                inputTextStyle: AppTextTheme.robotoLight18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
