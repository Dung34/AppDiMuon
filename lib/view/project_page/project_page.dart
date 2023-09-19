import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/resources/resources.dart';
import '../../shared/widgets/list_view/animation_listview.dart';
import '../../shared/widgets/something/no_data.dart';
import '../base/base_page_sate.dart';
import '.././project_page/cubit/project_cubit.dart';
import 'component/project_item.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends BasePageState<ProjectPage, ProjectCubit> {
  final ScrollController scrollController = ScrollController();

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
          child: const Text('Dự án', style: AppTextTheme.lexendBold24),
        ),
        Expanded(
          child: BlocBuilder<ProjectCubit, ProjectState>(
              builder: (context, state) {
            if (state is EventGetAllProjectSuccessState) {
              final projects = state.projects;
              // return ListView.builder(
              //   itemCount: projects.length,
              //   itemBuilder: (context, index) {
              //     return Padding(
              //       padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              //       child: ListTile(
              //         tileColor: AppColor.fourth200,
              //         title: Text(projects[index].name ?? ""),
              //       ),
              //     );
              //   },
              //   shrinkWrap: true,
              // );
              if (projects.isNotEmpty) {
                final items = List.generate(projects.length, (index) {
                  final project = projects[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProjectItem(project: project),
                      if (index == projects.length - 1)
                        const SizedBox(
                          height: 100,
                        ),
                    ],
                  );
                });
                return AnimationStaggeredListView(
                  items: items,
                  onRefresh: () async {
                    cubit.getAllProject();
                  },
                );
              } else {
                return const NoData();
              }
            }
            return const Center(child: CircularProgressIndicator());
          }),
        )
      ],
    );
  }
}
