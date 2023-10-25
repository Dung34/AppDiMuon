import 'package:flutter/material.dart';

import '../../data/resources/resources.dart';
import '../../domain/entity/okr/objective/objective.dart';
import '../../shared/utils/validation_utils.dart';
import '../../shared/widgets/button/primary_icon_button.dart';
import '../../shared/widgets/something/primary_app_bar.dart';
import '../../shared/widgets/text_field/primary_text_field.dart';
import 'cubit/okr_cubit.dart';

class ObjectiveUpdatePage extends StatelessWidget {
  final Objective objective;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final OkrCubit cubit;

  ObjectiveUpdatePage(
      {super.key, required this.cubit, required this.objective});

  @override
  Widget build(BuildContext context) {
    descriptionController.text = objective.description ?? '';
    titleController.text = objective.title ?? '';

    return Scaffold(
      appBar: PrimaryAppBar(
        actions: [
          PrimaryIconButton(
            context: context,
            icon: Icons.add_rounded,
            onPressed: () {
              cubit.updateObjective(objective
                ..title = titleController.text
                ..description = descriptionController.text);
              Navigator.pop(context);
            },
          ),
          const SizedBox(width: 10.0),
        ],
        title: "Sửa Objective",
      ),
      backgroundColor: AppColor.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8.0),
          const Text('Tên Objective', style: AppTextTheme.robotoRegular14),
          PrimaryTextField(
            controller: titleController,
            hintText: 'Tên objective',
            hintTextStyle: AppTextTheme.robotoRegular16,
            isRequired: true,
            maxLength: 100,
            validator: ValidationUtils.textEmptyValidator,
          ),
          const SizedBox(height: 10.0),
          const Text('Mô tả', style: AppTextTheme.robotoRegular14),
          PrimaryTextField(
            controller: descriptionController,
            hintText: 'Mô tả',
            hintTextStyle: AppTextTheme.robotoRegular16,
          ),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
