import 'package:flutter/material.dart';

import '../../data/resources/colors.dart';
import '../../data/resources/themes.dart';
import '../../shared/utils/validation_utils.dart';
import '../../shared/widgets/button/primary_icon_button.dart';
import '../../shared/widgets/something/primary_app_bar.dart';
import '../../shared/widgets/text_field/primary_text_field.dart';
import '../../../domain/entity/okr/key_result/key_result.dart';
import 'cubit/okr_cubit.dart';

class KeyResultUpdatePage extends StatelessWidget {
  final OkrCubit cubit;
  final KeyResult keyResult;
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController keyController = TextEditingController();
  final TextEditingController resultController = TextEditingController();
  final TextEditingController targetController = TextEditingController();
  final TextEditingController titleController = TextEditingController();

  KeyResultUpdatePage(
      {super.key, required this.keyResult, required this.cubit});

  @override
  Widget build(BuildContext context) {
    descriptionController.text = keyResult.description ?? '';
    keyController.text = keyResult.key ?? '';
    resultController.text = keyResult.result ?? '';
    targetController.text = (keyResult.target ?? '').toString();
    titleController.text = keyResult.title ?? '';

    return Scaffold(
      appBar: PrimaryAppBar(
        actions: [
          PrimaryIconButton(
              context: context,
              icon: Icons.edit,
              onPressed: () {
                _onCreateKeyResultPressed(
                  KeyResult(
                      id: keyResult.id,
                      title: titleController.text,
                      description: descriptionController.text,
                      key: keyController.text,
                      result: resultController.text,
                      target: double.parse(targetController.text),
                      objectiveId: keyResult.objectiveId,
                      okRsId: keyResult.okRsId),
                );
                Navigator.pop(context);
              }),
          const SizedBox(width: 10.0),
        ],
        title: "Sửa KeyResult",
      ),
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Tiêu đề', style: AppTextTheme.robotoRegular14),
            PrimaryTextField(
              controller: titleController,
              hintText: 'Tên key-result',
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
            const Text('Key', style: AppTextTheme.robotoRegular14),
            PrimaryTextField(
              controller: keyController,
              hintText: 'Key',
              hintTextStyle: AppTextTheme.robotoRegular16,
              validator: ValidationUtils.textEmptyValidator,
            ),
            const SizedBox(height: 10.0),
            const Text('Result', style: AppTextTheme.robotoRegular14),
            PrimaryTextField(
              controller: resultController,
              hintText: 'Kết quả',
              hintTextStyle: AppTextTheme.robotoRegular16,
              validator: ValidationUtils.textEmptyValidator,
            ),
            const SizedBox(height: 10.0),
            const Text('Mục tiêu hướng tới',
                style: AppTextTheme.robotoRegular14),
            PrimaryTextField(
              controller: targetController,
              hintText: '10.0',
              hintTextStyle: AppTextTheme.robotoRegular16,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }

  _onCreateKeyResultPressed(KeyResult keyResult) {
    cubit.updateKeyResult(keyResult);
  }
}
