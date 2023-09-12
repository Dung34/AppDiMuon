import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/resources/resources.dart';
import '../../domain/entity/report/report_daily.dart';
import '../../shared/etx/app_ext.dart';
import '../../shared/utils/date_time_utils.dart';
import '../../shared/utils/validation_utils.dart';
import '../../shared/widgets/something/primary_app_bar.dart';
import '../../shared/widgets/text_field/primary_text_field.dart';
import '../base/base_page_sate.dart';
import '../base/bloc/report/report_cubit.dart';

class ReportAddPage extends StatefulWidget {
  const ReportAddPage({super.key});

  @override
  State<ReportAddPage> createState() => _ReportAddPageState();
}

class _ReportAddPageState extends BasePageState<ReportAddPage, ReportCubit> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final titleFormKey = GlobalKey<FormState>();
  final descriptionFormKey = GlobalKey<FormState>();

  onUpdate() {
    final c1 = titleFormKey.currentState?.validate() ?? false;
    final c2 = descriptionFormKey.currentState?.validate() ?? false;
    if (!c1 || !c2) {
      context.pop();
      return;
    }
    cubit.addReport(ReportDaily(
        description: descriptionController.text.trim(),
        title: titleController.text.trim()));
  }

  @override
  Widget buildPage(BuildContext context) {
    return BlocListener<ReportCubit, ReportState>(
      listener: (context, state) {
        if (state is AddReportSuccess) {
          showLoading();
          context.pop();
        }
      },
      child: Scaffold(
        backgroundColor: AppColor.primaryBackgroundColor,
        appBar: PrimaryAppBar(
          canPop: true,
          title: " Báo cáo hằng ngày",
          actions: [
            IconButton(
                onPressed: () {
                  cubit.addReport(ReportDaily(
                      title: titleController.text.trim(),
                      description: descriptionController.text.trim()));
                },
                icon: const Icon(
                  Icons.edit_note_rounded,
                  color: Colors.black,
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Tiêu đề'),
              PrimaryTextField(
                borderColor: Colors.black,
                maxLines: 20,
                controller: titleController,
                border: InputBorder.none,
                hintText: "Thêm tiêu đề",
                inputTextStyle: AppTextTheme.robotoMedium18,
                maxLength: 100,
                hintTextStyle: AppTextTheme.robotoLight18
                    .copyWith(color: AppColor.fourth700),
                isRequired: true,
                validator: ValidationUtils.textEmptyValidator,
              ),
              const Text("Thời gian"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    child: Text(
                  DateTimeUtils.formatDate(DateTime.now().toString()),
                  style: AppTextTheme.robotoMedium18,
                )),
              ),
              const Text('Nội dung'),
              PrimaryTextField(
                controller: descriptionController,
                border: InputBorder.none,
                hintText: "Thêm nội dung",
                inputTextStyle: AppTextTheme.robotoMedium18,
                maxLength: 1000,
                hintTextStyle: AppTextTheme.robotoLight18
                    .copyWith(color: AppColor.fourth700),
                isRequired: true,
                validator: ValidationUtils.textEmptyValidator,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
