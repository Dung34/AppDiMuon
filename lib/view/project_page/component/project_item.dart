import 'package:flutter/material.dart';

import '../../../data/resources/colors.dart';
import '../../../data/resources/themes.dart';
import '../../../domain/entity/project/project.dart';
import '../../../shared/widgets/button/primary_icon_button.dart';
import '../../base/base_page_sate.dart';
import '../cubit/project_cubit.dart';

class ProjectItem extends StatefulWidget {
  final Project project;

  const ProjectItem({super.key, required this.project});

  @override
  State<ProjectItem> createState() => _ProjectItemState();
}

class _ProjectItemState extends BasePageState<ProjectItem, ProjectCubit> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(width: 1.0, color: AppColor.primary50))),
      padding: const EdgeInsets.only(bottom: 16.0, top: 16.0),
      child: Row(children: [
        Text(
          widget.project.name ?? '',
          style: AppTextTheme.lexendBold18,
        ),
        const Spacer(),
        PrimaryIconButton(
          context: context,
          icon: Icons.arrow_circle_right_outlined,
          iconColor: AppColor.secondary400,
          onPressed: () {},
        )
      ]),
    );
  }
}
