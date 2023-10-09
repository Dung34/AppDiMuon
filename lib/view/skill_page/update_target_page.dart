import 'dart:developer';

import 'package:flutter/material.dart';

import '../../config/routes.dart';
import '../../data/constant/enum.dart';
import '../../data/repository/local/local_data_access.dart';
import '../../data/resources/themes.dart';
import '../../di/di.dart';
import '../../domain/entity/target/target.dart';
import '../../shared/etx/app_ext.dart';
import '../../shared/utils/validation_utils.dart';
import '../../shared/widgets/dropdown/base_dropdown_value.dart';
import '../../shared/widgets/dropdown/primary_drop_down_form_field.dart';
import '../../shared/widgets/something/primary_app_bar.dart';
import '../../shared/widgets/text_field/primary_text_field.dart';
import '../base/base_page_sate.dart';
import '../base/bloc/target/target_cubit.dart';

class TargetUpdatePage extends StatefulWidget {
  const TargetUpdatePage({super.key});

  @override
  State<TargetUpdatePage> createState() => _TargetUpdatePageState();
}

class _TargetUpdatePageState
    extends BasePageState<TargetUpdatePage, TargetCubit> {
  late Target currentTarget;
  late final Target updateTarget;
  final LocalDataAccess _localDataAccess = getIt.get<LocalDataAccess>();
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    args = context.arguments as TargetPageArgs;
    setCubit = args.targetCubit;

    if (!args.addNew) {
      currentTarget = args.target!;
      updateTarget = currentTarget.copyWith();
      titleController.text = updateTarget.title!;
      descriptionController.text = updateTarget.description!;
      targetController.text = updateTarget.target.toString();
      actualController.text = updateTarget.actual.toString();
      typeController.text = updateTarget.type.toString();
      statusController.text = updateTarget.status.toString();
      log(targetController.text);
      log(updateTarget.target.toString());
      log(currentTarget.target.toString());
    }

    setAppBar = PrimaryAppBar(
      title: (!args.addNew) ? "Chỉnh sửa mục tiêu" : "Tạo mục tiêu mới",
      canPop: true,
      actions: [
        IconButton(
            onPressed: () {
              // String targetStr = targetController.text;
              // double targetData = double.parse(targetStr);
              // String actualStr = actualController.text;
              // double actualData = double.parse(actualStr);
              // String typeStr = typeController.text;
              // int typeData = int.parse(typeStr);
              // String statusStr = statusController.text;
              // int statusData = int.parse(statusStr);

              if (!args.addNew) {
                log(targetController.text);
                updateTarget.title = titleController.text.trim();
                updateTarget.description = descriptionController.text.trim();
                updateTarget.target = double.tryParse(targetController.text);
                updateTarget.actual = double.tryParse(actualController.text);
                cubit.updateTarget(updateTarget);
              } else {
                // cubit.addNewTarget(Target(
                //   userId: _localDataAccess.getUserId(),
                //   title: titleController.text.trim(),
                //   description: descriptionController.text.trim(),
                //   target: targetData,
                //   actual: actualData,
                //   type: typeData,
                //   status: int.parse(typeController.text),
                // ));
              }
              context.pop();
            },
            icon: const Icon(Icons.edit))
      ],
    );
  }

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController targetController = TextEditingController();
  final TextEditingController actualController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController statusController = TextEditingController();
  late final TargetPageArgs args;
  List<BaseDropdownValue> typeDropItem = [
    const BaseDropdownValue(id: "0", valueStr: "Mục tiêu theo point"),
    const BaseDropdownValue(id: "1", valueStr: "Mục tiêu theo task")
  ];
  List<BaseDropdownValue> statusDropItem = [
    const BaseDropdownValue(id: "0", valueStr: "Chưa bắt đầu"),
    const BaseDropdownValue(id: "1", valueStr: "Bắt đầu"),
    const BaseDropdownValue(id: "2", valueStr: "Kết thúc"),
    const BaseDropdownValue(id: "3", valueStr: "Quá hạn")
  ];
  @override
  Widget buildPage(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PrimaryTextField(
            controller: titleController,
            label: "Tiêu đề",
          ),
          PrimaryTextField(
            controller: descriptionController,
            label: "Mô tả",
          ),
          PrimaryTextField(
            controller: startDateController,
            inputType: AppInputType.datePicker,
            inputTextStyle: AppTextTheme.robotoLight14,
            keyboardType: TextInputType.datetime,
            context: context,
            label: "Ngày bắt đầu",
          ),
          PrimaryTextField(
            controller: endDateController,
            inputType: AppInputType.datePicker,
            inputTextStyle: AppTextTheme.robotoLight14,
            context: context,
            label: "Ngày kết thúc",
            onDateSelected: (value) {},
          ),
          PrimaryTextField(
            controller: targetController,
            keyboardType: TextInputType.number,
            label: "Mục tiêu",
          ),
          PrimaryTextField(
            controller: typeController,
            inputType: AppInputType.dropDown,
            data: typeDropItem,
            onDropdownValueChanged: (value) {
              updateTarget.type = int.tryParse(value!.id!);
            },
          ),
          PrimaryTextField(
            controller: actualController,
            keyboardType: TextInputType.number,
            label: "Điểm hiện tại",
          ),
          PrimaryDropDownFormField(
            controller: statusController,
            items: statusDropItem,
            onChanged: (value) {
              updateTarget.status = int.tryParse(value.id!);
            },
          )
        ],
      ),
    );
  }
}
