import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/routes.dart';
import '../../data/repository/local/local_data_access.dart';
import '../../data/resources/resources.dart';
import '../../di/di.dart';
import '../../domain/entity/skill/skill.dart';
import '../../shared/etx/app_ext.dart';
import '../../shared/utils/validation_utils.dart';
import '../../shared/widgets/something/primary_app_bar.dart';
import '../../shared/widgets/text_field/primary_text_field.dart';
import '../base/base_page_sate.dart';
import '../base/bloc/skill/skill_cubit.dart';

class SkillUpdatePage extends StatefulWidget {
  const SkillUpdatePage({super.key});

  @override
  State<SkillUpdatePage> createState() => _SkillUpdatePageState();
}

class _SkillUpdatePageState extends BasePageState<SkillUpdatePage, SkillCubit> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController iconController = TextEditingController();
  final TextEditingController pointController = TextEditingController();
  late Skill currentSkill;
  late final Skill updateSkill;
  LocalDataAccess localDataAccess = getIt.get<LocalDataAccess>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    args = context.arguments as SkillPageArgs;
    setCubit = args.skillCubit;

    if (!args.addNew) {
      currentSkill = args.skill!;
      updateSkill = currentSkill.copyWith();
      nameController.text = updateSkill.name ?? "";
      descriptionController.text = updateSkill.description ?? "";
      iconController.text = updateSkill.icon ?? "";
      pointController.text = updateSkill.point.toString();
    } else {
      updateSkill = Skill(userId: localDataAccess.getUserId(), point: 0);
    }

    setAppBar = PrimaryAppBar(
      title: args.addNew ? "Thêm kĩ năng" : "Chỉnh sửa kĩ năng",
      canPop: true,
      actions: [
        IconButton(
            onPressed: () {
              String intString = pointController.text;
              int pointData = int.parse(intString);
              updateSkill.name = nameController.text.trim();
              updateSkill.description = descriptionController.text.trim();
              updateSkill.icon = iconController.text.trim();
              updateSkill.point = pointData;
              if (!args.addNew) {
                cubit.updateSkill(updateSkill);
              } else {
                cubit.addSkill(updateSkill);
              }

              context.pop();
            },
            icon: (args.addNew)
                ? SvgPicture.asset(Assets.icAdd)
                : SvgPicture.asset(Assets.icEdit))
      ],
    );
  }

  late final SkillPageArgs args;
  @override
  Widget buildPage(BuildContext context) {
    return Column(
      children: [
        PrimaryTextField(
          controller: nameController,
          label: "Tên kĩ năng",
          hintText: 'Nhập kĩ năng',
          isRequired: true,
          maxLength: 50,
          validator: ValidationUtils.textEmptyValidator,
          textCapitalization: TextCapitalization.words,
        ),
        const SizedBox(
          height: 10,
        ),
        PrimaryTextField(
          controller: descriptionController,
          label: "Mô tả",
          hintText: 'Mô tả kĩ năng',
          isRequired: true,
          maxLength: 200,
          validator: ValidationUtils.textEmptyValidator,
          textCapitalization: TextCapitalization.words,
        ),
        const SizedBox(
          height: 10,
        ),
        PrimaryTextField(
          controller: iconController,
          label: "Icon",
          isRequired: true,
          hintText: "Icon",
        ),
        const SizedBox(
          height: 10,
        ),
        PrimaryTextField(
          controller: pointController,
          label: "Điểm số",
          keyboardType: TextInputType.number,
          hintText: "Điểm số",
          isRequired: true,
        )
      ],
    );
  }
}
