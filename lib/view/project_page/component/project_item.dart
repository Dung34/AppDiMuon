import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/routes.dart';
import '../../../data/resources/colors.dart';
import '../../../data/resources/themes.dart';
import '../../../domain/entity/project/project.dart';
import '../cubit/project_cubit.dart';

class ProjectItem extends StatefulWidget {
  final Project project;

  const ProjectItem({super.key, required this.project});

  @override
  State<ProjectItem> createState() => _ProjectItemState();
}

class _ProjectItemState extends State<ProjectItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoute.projectDetail,
            arguments: ProjectDetailPageArgs(
              projectId: widget.project.id!,
              projectCubit: context.read<ProjectCubit>(),
            ));
      },
      child: Container(
        decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(width: 1.0, color: AppColor.primary50))),
        padding: const EdgeInsets.only(bottom: 16.0, top: 16.0),
        child: Row(children: [
          Text(
            widget.project.name ?? '',
            style: AppTextTheme.robotoMedium18,
          ),
          const Spacer(),
          widget.project.status == 0
              ? const Text('Chưa hoàn thành',
                  style: AppTextTheme.robotoItalic12)
              : const Text(
                  'Đã hoàn thành',
                  style: AppTextTheme.robotoRegular12,
                ),
        ]),
      ),
    );
  }
}
