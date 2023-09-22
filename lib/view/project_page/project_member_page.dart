import 'package:flutter/material.dart';

import '../../config/routes.dart';
import '../../data/resources/resources.dart';
import '../../domain/entity/project/project.dart';
import '../../shared/etx/app_ext.dart';
import '../../shared/widgets/image/primary_circle_image.dart';
import '../../shared/widgets/something/primary_app_bar.dart';

class ProjectMemberPage extends StatefulWidget {
  const ProjectMemberPage({super.key});

  @override
  State<ProjectMemberPage> createState() => _ProjectMemberPageState();
}

class _ProjectMemberPageState extends State<ProjectMemberPage> {
  late final ProjectMemberPageArgs args;
  late List<ProjectMembers>? projectMembers;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    args = context.arguments as ProjectMemberPageArgs;
    projectMembers = args.projectMembers;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PrimaryAppBar(
          title: "Thành viên",
          leading: IconButton(
            color: AppColor.black,
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: AppColor.white,
        body: GridView.count(
          crossAxisCount: 2,
          children: List.generate(projectMembers?.length ?? 0, (index) {
            return MemberItem(
                memberName: 'Kẻ ẩn danh',
                role: projectMembers?[index].role ?? 0);
          }),
        ));
  }
}

class MemberItem extends StatelessWidget {
  final String memberName;
  final int role;

  const MemberItem({super.key, required this.memberName, required this.role});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          backgroundColor: AppColor.white,
          radius: 40,
          child: PrimaryCircleImage(
            radius: 36,
            imageUrl: '',
          ),
        ),
        const SizedBox(width: 10.0),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              memberName,
              style: AppTextTheme.robotoBold16,
            ),
            const SizedBox(height: 8.0),
            Text(role == 0 ? 'Thành viên' : 'Quản trị viên')
          ],
        )
      ],
    );
  }
}
