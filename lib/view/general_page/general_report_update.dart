import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../config/routes.dart';
import '../../data/constant/enum.dart';
import '../../data/resources/resources.dart';
import '../../domain/entity/taskoverview/general_report.dart';
import '../../shared/etx/app_ext.dart';
import '../../shared/utils/validation_utils.dart';

import '../../shared/widgets/something/no_data.dart';
import '../../shared/widgets/something/primary_app_bar.dart';
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
  final TextEditingController addControler = TextEditingController();
  final TextEditingController dateFromController = TextEditingController();
  final TextEditingController dateToController = TextEditingController();
  late final GeneralReportArgs args;

  @override
  bool get useBlocProviderValue => true;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    args = context.arguments as GeneralReportArgs;
    setCubit = args.generalReportCubit;
    cubit.getGeneralReportDetail(args.reportId);
  }

  @override
  Widget buildPage(BuildContext context) {
    //final screenWidth = MediaQuery.of(context).size.width;
    return BlocConsumer<GeneralReportCubit, GeneralReportState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is GetGeneralReportSuccess) {
          return Scaffold(
            backgroundColor: AppColor.primaryBackgroundColor,
            appBar: PrimaryAppBar(
              canPop: true,
              title: "Chỉnh sửa báo cáo",
              actions: [
                IconButton(
                    onPressed: () {
                      String dateFromString = dateFromController.text;
                      String dateToString = dateToController.text;
                      DateFormat dateFormat = DateFormat("dd/MM/yyyy");
                      DateTime dateFromTime = dateFormat.parse(dateFromString);
                      DateTime datetoTime = dateFormat.parse(dateToString);
                      cubit.updateGeneralReport(GeneralReport(
                        dateFrom: dateFromTime.toIso8601String(),
                        dateTo: datetoTime.toIso8601String(),
                        id: args.reportId,
                        title: titleController.text.trim(),
                        add: addControler.text.trim(),
                        issue: issueController.text.trim(),
                        workDone: workdoneController.text.trim(),
                        description: descriptionController.text.trim(),
                      ));
                    },
                    icon: SvgPicture.asset(Assets.icAdd))
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PrimaryTextField(
                    controller: titleController,
                    label: "Tiêu đề",
                    inputTextStyle: AppTextTheme.robotoLight14,
                    isRequired: true,
                    validator: ValidationUtils.textEmptyValidator,
                  ),
                  PrimaryTextField(
                    controller: dateFromController,
                    label: "Từ ngày",
                    inputType: AppInputType.datePicker,
                    context: context,
                    inputTextStyle: AppTextTheme.robotoLight14,
                    isRequired: true,
                    validator: ValidationUtils.textEmptyValidator,
                  ),
                  PrimaryTextField(
                    controller: dateToController,
                    label: "Đến ngày",
                    inputType: AppInputType.datePicker,
                    context: context,
                    inputTextStyle: AppTextTheme.robotoLight14,
                    isRequired: true,
                    validator: ValidationUtils.textEmptyValidator,
                  ),
                  PrimaryTextField(
                    controller: workdoneController,
                    label: "Đã làm",
                    inputTextStyle: AppTextTheme.robotoLight14,
                    isRequired: true,
                    validator: ValidationUtils.textEmptyValidator,
                  ),
                  PrimaryTextField(
                    controller: issueController,
                    label: "Vấn đề",
                    inputTextStyle: AppTextTheme.robotoLight14,
                    isRequired: true,
                    validator: ValidationUtils.textEmptyValidator,
                  ),
                  PrimaryTextField(
                    controller: addControler,
                    label: "Thêm",
                    inputTextStyle: AppTextTheme.robotoLight14,
                    isRequired: true,
                    validator: ValidationUtils.textEmptyValidator,
                  ),
                  PrimaryTextField(
                    controller: descriptionController,
                    label: "Mô tả",
                    inputTextStyle: AppTextTheme.robotoLight14,
                    isRequired: true,
                    validator: ValidationUtils.textEmptyValidator,
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
