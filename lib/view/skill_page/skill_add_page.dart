import 'package:flutter/material.dart';

import '../../data/repository/local/local_data_access.dart';
import '../../data/resources/resources.dart';
import '../../di/di.dart';
import '../../domain/entity/skill/skill.dart';
import '../../shared/etx/app_ext.dart';
import '../../shared/widgets/something/primary_app_bar.dart';
import '../../shared/widgets/text_field/primary_text_field.dart';
import '../base/base_page_sate.dart';
import '../base/bloc/skill/skill_cubit.dart';

class SkillAddPage extends StatefulWidget {
  const SkillAddPage({super.key});

  @override
  State<SkillAddPage> createState() => _SkillAddPageState();
}

class _SkillAddPageState extends BasePageState<SkillAddPage, SkillCubit> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController iconController = TextEditingController();

  LocalDataAccess localDataAccess = getIt.get<LocalDataAccess>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget buildPage(BuildContext context) {
    final userId = localDataAccess.getUserId();
    return Scaffold(
        backgroundColor: AppColor.primaryBackgroundColor,
        appBar: PrimaryAppBar(
          title: "Thêm kĩ năng",
          canPop: true,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            PrimaryTextField(controller: nameController, label: "Tên kĩ năng"),
            SizedBox(
              height: 20,
            ),
            PrimaryTextField(
              controller: descriptionController,
              label: "Mô tả",
            ),
            SizedBox(
              height: 20,
            ),
            PrimaryTextField(controller: iconController, label: "Icon"),
            SizedBox(
              height: 20,
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (() {
            cubit.addSkill(Skill(
                userId: userId,
                description: descriptionController.text.trim(),
                icon: iconController.text.trim(),
                name: nameController.text.trim(),
                point: 100));
            context.pop();
          }),
        ));
  }
}
