import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/resources/resources.dart';
import '../base/base_page_sate.dart';
import '.././project_page/cubit/project_cubit.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends BasePageState<ProjectPage, ProjectCubit> {
  @override
  void initState() {
    super.initState();
    cubit.getAllProject();
  }

  @override
  Widget buildPage(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(
              top: 20, left: 8.0, right: 8.0, bottom: 8.0),
          child: Text(
            'List project',
            style: AppTextTheme.textAppBarPrimary
                .copyWith(color: AppColor.black, fontSize: 24),
          ),
        ),
        Expanded(
          child: BlocBuilder<ProjectCubit, ProjectState>(
              builder: (context, state) {
            if (state is EventGetAllProjectSuccessState) {
              final projects = state.projects;
              return ListView.builder(
                itemCount: projects.length,
                itemBuilder: (context, index) {
                  print(projects[index].name);
                  return Padding(
                    padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: ListTile(
                      tileColor: AppColor.fourth200,
                      title: Text(projects[index].name ?? ""),
                    ),
                  );
                },
              );
            }
            return const Center(child: CircularProgressIndicator());
          }),
        )
      ],
    );
  }
}
