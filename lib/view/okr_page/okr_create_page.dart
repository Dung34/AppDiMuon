import 'package:flutter/material.dart';

import '../../data/resources/colors.dart';
import '../../data/resources/themes.dart';
import '../../domain/entity/okr/okr_wrapper/okr.dart';
import '../../shared/utils/validation_utils.dart';
import '../../shared/widgets/button/primary_icon_button.dart';
import '../../shared/widgets/something/primary_app_bar.dart';
import '../../shared/widgets/text_field/primary_text_field.dart';
import '../unit_page/cubit/unit_cubit.dart';
import 'cubit/okr_cubit.dart';

class OKRCreatePage extends StatefulWidget {
  final String unitId;
  final OkrCubit cubit;
  final UnitCubit unitCubit;

  const OKRCreatePage(
      {super.key,
      required this.unitId,
      required this.cubit,
      required this.unitCubit});

  @override
  State<OKRCreatePage> createState() => _OKRCreatePageState();
}

class _OKRCreatePageState extends State<OKRCreatePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  void createOKR() {
    widget.cubit.createOKR(OKR(
        name: nameController.text,
        description: nameController.text,
        unitId: widget.unitId));

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: "Thêm OKR",
        actions: [
          const SizedBox(width: 10.0),
          PrimaryIconButton(
            context: context,
            onPressed: createOKR,
            icon: Icons.add,
          ),
          const SizedBox(width: 16.0)
        ],
      ),
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Tên', style: AppTextTheme.robotoBold16),
              PrimaryTextField(
                controller: nameController,
                border: InputBorder.none,
                hintText: "Tên của OKR",
                inputTextStyle: AppTextTheme.robotoMedium16,
                maxLength: 1000,
                hintTextStyle: AppTextTheme.robotoLight18
                    .copyWith(color: AppColor.fourth700),
                isRequired: true,
                validator: ValidationUtils.textEmptyValidator,
              ),
              const Text('Mô tả', style: AppTextTheme.robotoBold16),
              PrimaryTextField(
                controller: descriptionController,
                border: InputBorder.none,
                hintText: "Mô tả của OKR",
                inputTextStyle: AppTextTheme.robotoMedium16,
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
