import 'package:flutter/material.dart';

import '../../data/resources/resources.dart';
import '../../domain/entity/okr/objective/objective.dart';
import '../../shared/utils/validation_utils.dart';
import '../../shared/widgets/button/primary_icon_button.dart';
import '../../shared/widgets/something/no_data.dart';
import '../../shared/widgets/something/primary_app_bar.dart';
import '../../shared/widgets/text_field/primary_text_field.dart';
import 'component/objective_item.dart';
import 'cubit/okr_cubit.dart';

class ObjectiveAddPage extends StatelessWidget {
  final String okrsId;
  final String unitId;
  final List<Objective> objectives;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final OkrCubit cubit;

  ObjectiveAddPage(
      {super.key,
      required this.okrsId,
      required this.unitId,
      required this.cubit,
      required this.objectives});

  @override
  Widget build(BuildContext context) {
    List<String> related = [];

    return Scaffold(
      appBar: PrimaryAppBar(
        actions: [
          PrimaryIconButton(
            context: context,
            icon: Icons.add_rounded,
            onPressed: () {
              cubit.createObjective(
                  Objective(
                    okrId: okrsId,
                    unitId: unitId,
                    title: titleController.text,
                    description: descriptionController.text,
                  ),
                  related);
              Navigator.pop(context);
            },
          ),
          const SizedBox(width: 10.0),
        ],
        title: "Thêm Objective",
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
          const Text('Objectives liên quan',
              style: AppTextTheme.robotoRegular14),
          objectives.isNotEmpty
              ? Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ObjectiveItem(
                        checkable: true,
                        objective: objectives[index],
                        cubit: cubit,
                        related: related,
                        isAdmin: true,
                      );
                    },
                    itemCount: objectives.length,
                  ),
                )
              : const NoData(),
        ],
      ),
    );
  }
}
