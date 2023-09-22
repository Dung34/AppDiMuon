import 'package:flutter/material.dart';

import '../../data/resources/resources.dart';

class ProjectMemberPage extends StatefulWidget {
  const ProjectMemberPage({super.key});

  @override
  State<ProjectMemberPage> createState() => _ProjectMemberPageState();
}

class _ProjectMemberPageState extends State<ProjectMemberPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Thành viên',
          style: AppTextTheme.lexendBold24,
        ),
      ),
      body: Column(children: [
        Container(),
      ]),
    );
  }
}
