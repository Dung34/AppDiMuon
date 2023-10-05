import 'package:flutter/material.dart';

import '../../config/routes.dart';
import '../../domain/entity/skill/skill.dart';
import '../../shared/etx/app_ext.dart';
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
  @override
  // TODO: implement useBlocProviderValue
  bool get useBlocProviderValue => true;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController iconController = TextEditingController();
  late Skill currentSkill;
  late final Skill updateSkill;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    args = context.arguments as SkillPageArgs;
    setCubit = args.skillCubit;
    currentSkill = cubit.getDetailSkill(args.id);
    updateSkill = currentSkill.copyWith();
    nameController.text = updateSkill.name ?? "";
    descriptionController.text = updateSkill.description ?? "";
    iconController.text = updateSkill.icon ?? "";
    setAppBar = PrimaryAppBar(
      title: "Chỉnh sửa kĩ năng",
      canPop: true,
      actions: [
        IconButton(
            onPressed: () {
              cubit.updateSkill(updateSkill);
            },
            icon: Icon(Icons.edit))
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
        ),
        PrimaryTextField(
          controller: descriptionController,
          label: "Mô tả",
        ),
        PrimaryTextField(
          controller: iconController,
          label: "Icon",
        )
      ],
    );
  }
}
