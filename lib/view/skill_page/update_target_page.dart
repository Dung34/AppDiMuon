import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../config/routes.dart';
import '../../data/constant/enum.dart';
import '../../data/repository/local/local_data_access.dart';
import '../../data/resources/colors.dart';
import '../../data/resources/resources.dart';
import '../../data/resources/themes.dart';
import '../../di/di.dart';
import '../../domain/entity/target/target.dart';
import '../../shared/etx/app_ext.dart';
import '../../shared/utils/date_time_utils.dart';
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
      targetController.text = updateTarget.targe.toString();
      actualController.text = updateTarget.actual.toString();
      typeController.text = updateTarget.type.toString();
      statusController.text = updateTarget.status.toString();
      // startDateController.text = updateTarget.startDate.toString();

      log(targetController.text);
      log(updateTarget.targe.toString());
      log(currentTarget.targe.toString());
    } else {
      updateTarget = Target(
          userId: _localDataAccess.getUserId(),
          startDate: DateTime.now().toIso8601String(),
          endDate: DateTime.now().toIso8601String(),
          status: 0,
          type: 0);
    }
    currentStatus = statusDropItem[updateTarget.status!];
    currentType = typeDropItem[updateTarget.type!];
    DateTime startTime = DateTime.parse(updateTarget.startDate.toString());
    startDateController.text = DateFormat("dd/MM/yyyy").format(startTime);
    DateTime endTime = DateTime.parse(updateTarget.endDate.toString());
    endDateController.text = DateFormat("dd/MM/yyyy").format(endTime);

    setAppBar = PrimaryAppBar(
      title: (!args.addNew) ? "Chỉnh sửa mục tiêu" : "Tạo mục tiêu mới",
      canPop: true,
      actions: [
        IconButton(
            onPressed: () {
              log(targetController.text);
              updateTarget.title = titleController.text.trim();
              updateTarget.description = descriptionController.text.trim();
              updateTarget.targe = double.tryParse(targetController.text);
              updateTarget.actual = double.tryParse(actualController.text);
              if (!args.addNew) {
                cubit.updateTarget(updateTarget);
              } else {
                cubit.addNewTarget(updateTarget);
              }
              context.pop();
            },
            icon: (args.addNew)
                ? SvgPicture.asset(Assets.icAdd)
                : SvgPicture.asset(Assets.icEdit))
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
  late BaseDropdownValue currentStatus;
  late BaseDropdownValue currentType;
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
            initialDate: DateTime.parse(updateTarget.startDate!),
            label: "Ngày bắt đầu",
            onDateSelected: (value) {
              updateTarget.startDate = value.toIso8601String();
            },
          ),
          PrimaryTextField(
            controller: endDateController,
            inputType: AppInputType.datePicker,
            inputTextStyle: AppTextTheme.robotoLight14,
            context: context,
            initialDate: DateTime.parse(updateTarget.endDate!),
            label: "Ngày kết thúc",
            onDateSelected: (value) {
              updateTarget.endDate = value.toIso8601String();
            },
          ),
          PrimaryTextField(
            controller: targetController,
            keyboardType: TextInputType.number,
            label: "Mục tiêu",
          ),
          PrimaryTextField(
            fillColor: AppColor.primaryBackgroundColor,
            controller: typeController,
            inputType: AppInputType.dropDown,
            data: typeDropItem,
            initialValue: currentType,
            onDropdownValueChanged: (value) {
              updateTarget.type = int.tryParse(value!.id!);
            },
          ),
          PrimaryTextField(
            controller: actualController,
            keyboardType: TextInputType.number,
            label: "Điểm hiện tại",
          ),
          PrimaryTextField(
            fillColor: AppColor.primaryBackgroundColor,
            inputType: AppInputType.dropDown,
            controller: statusController,
            data: statusDropItem,
            initialValue: currentStatus,
            label: "Trạng thái",
            onDropdownValueChanged: (value) {
              updateTarget.status = int.tryParse(value!.id!);
            },
          )
        ],
      ),
    );
  }
}
