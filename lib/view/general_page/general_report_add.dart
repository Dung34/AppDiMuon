import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../data/constant/enum.dart';
import '../../data/resources/resources.dart';
import '../../domain/entity/taskoverview/general_report.dart';
import '../../shared/etx/app_ext.dart';
import '../../shared/utils/validation_utils.dart';
import '../../shared/widgets/something/primary_app_bar.dart';
import '../../shared/widgets/text_field/primary_text_field.dart';
import '../base/base_page_sate.dart';
import '../base/bloc/general_report/general_report_cubit.dart';

class GeneReportAdd extends StatefulWidget {
  const GeneReportAdd({super.key});

  @override
  State<GeneReportAdd> createState() => _GeneReportAddState();
}

class _GeneReportAddState
    extends BasePageState<GeneReportAdd, GeneralReportCubit> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController workDoneController = TextEditingController();
  final TextEditingController issueController = TextEditingController();
  final TextEditingController addController = TextEditingController();
  TextEditingController dateFromController = TextEditingController();
  TextEditingController dateToController = TextEditingController();

  late final GeneralReport reportUpdate;

  @override
  Widget buildPage(BuildContext context) {
    return BlocListener<GeneralReportCubit, GeneralReportState>(
      listener: (context, state) {},
      child: Scaffold(
        backgroundColor: AppColor.primaryBackgroundColor,
        appBar: PrimaryAppBar(
          canPop: true,
          title: "Báo cáo tổng quan",
          actions: [
            IconButton(
                onPressed: () {
                  String dateFromString = dateFromController.text;
                  String dateToString = dateToController.text;
                  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
                  DateTime dateFromTime = dateFormat.parse(dateFromString);
                  DateTime dateToTime = dateFormat.parse(dateToString);
                  cubit.addGeneralReport(
                    GeneralReport(
                      dateFrom: dateFromTime.toIso8601String(),
                      dateTo: dateToTime.toIso8601String(),
                      title: titleController.text.trim(),
                      description: descriptionController.text.trim(),
                      add: addController.text.trim(),
                      workDone: workDoneController.text.trim(),
                      issue: issueController.text.trim(),
                    ),
                  );
                  context.pop();
                },
                icon: SvgPicture.asset(Assets.icEdit))
          ],
        ),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              child: Text(
                'Tiêu đề',
                style: AppTextTheme.robotoLight14,
              ),
            ),
            PrimaryTextField(
              borderColor: Colors.black,
              maxLines: 20,
              controller: titleController,
              inputTextStyle: AppTextTheme.robotoMedium18,
              maxLength: 100,
              hintTextStyle: AppTextTheme.robotoLight18
                  .copyWith(color: AppColor.fourth700),
              isRequired: true,
              validator: ValidationUtils.textEmptyValidator,
            ),
            SizedBox(child: Text('Từ ngày', style: AppTextTheme.robotoLight14)),
            PrimaryTextField(
              controller: dateFromController,
              inputType: AppInputType.datePicker,
              context: context,
              onDateSelected: (value) {},
            ),
            SizedBox(
              child: Text(
                'Đến ngày',
                style: AppTextTheme.robotoLight14,
              ),
            ),
            PrimaryTextField(
              controller: dateToController,
              border: InputBorder.none,
              inputTextStyle: AppTextTheme.robotoMedium18,
              hintTextStyle: AppTextTheme.robotoLight18
                  .copyWith(color: AppColor.fourth700),
              onDateSelected: (value) {},
              inputType: AppInputType.datePicker,
              context: context,
            ),
            SizedBox(
              child: Text(
                'Đã làm',
                style: AppTextTheme.robotoLight14,
              ),
            ),
            PrimaryTextField(
              borderColor: Colors.black,
              maxLines: 20,
              controller: workDoneController,
              inputTextStyle: AppTextTheme.robotoMedium18,
              maxLength: 100,
              hintTextStyle: AppTextTheme.robotoLight18
                  .copyWith(color: AppColor.fourth700),
              isRequired: true,
              validator: ValidationUtils.textEmptyValidator,
            ),
            SizedBox(
              child: Text(
                'Vấn đề',
                style: AppTextTheme.robotoLight14,
              ),
            ),
            PrimaryTextField(
              borderColor: Colors.black,
              maxLines: 20,
              controller: issueController,
              inputTextStyle: AppTextTheme.robotoMedium18,
              maxLength: 100,
              hintTextStyle: AppTextTheme.robotoLight18
                  .copyWith(color: AppColor.fourth700),
              isRequired: true,
              validator: ValidationUtils.textEmptyValidator,
            ),
            SizedBox(
              child: Text(
                'Thêm',
                style: AppTextTheme.robotoLight14,
              ),
            ),
            PrimaryTextField(
              borderColor: Colors.black,
              maxLines: 20,
              controller: addController,
              inputTextStyle: AppTextTheme.robotoMedium18,
              maxLength: 100,
              hintTextStyle: AppTextTheme.robotoLight18
                  .copyWith(color: AppColor.fourth700),
              isRequired: true,
              validator: ValidationUtils.textEmptyValidator,
            ),
            SizedBox(
              child: Text(
                'Mô tả',
                style: AppTextTheme.robotoLight14,
              ),
            ),
            PrimaryTextField(
              borderColor: Colors.black,
              maxLines: 20,
              controller: descriptionController,
              inputTextStyle: AppTextTheme.robotoMedium18,
              maxLength: 100,
              hintTextStyle: AppTextTheme.robotoLight18
                  .copyWith(color: AppColor.fourth700),
              isRequired: true,
              validator: ValidationUtils.textEmptyValidator,
            ),
          ]),
        ),
      ),
    );
  }
}
