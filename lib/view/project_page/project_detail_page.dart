import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/routes.dart';
import '../../data/resources/resources.dart';
import '../../shared/etx/app_ext.dart';
import '../../shared/widgets/something/no_data.dart';
import '../../shared/widgets/something/primary_app_bar.dart';
import '../base/base_page_sate.dart';
import 'cubit/project_cubit.dart';

class ProjectDetailPage extends StatefulWidget {
  const ProjectDetailPage({super.key});

  @override
  State<ProjectDetailPage> createState() => _ProjectDetailPageState();
}

class _ProjectDetailPageState
    extends BasePageState<ProjectDetailPage, ProjectCubit> {
  late final ProjectDetailPageArgs args;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    args = context.arguments as ProjectDetailPageArgs;
    setCubit = args.projectCubit;

    cubit.getProjectById(args.projectId);
  }

  @override
  Widget buildPage(BuildContext context) {
    return BlocBuilder<ProjectCubit, ProjectState>(
      buildWhen: (previous, current) =>
          current is EventGetProjectByIdSuccessState,
      builder: (context, state) {
        if (state is EventGetProjectByIdSuccessState) {
          final project = state.project;

          return Scaffold(
            backgroundColor: AppColor.primaryBackgroundColor,
            appBar: PrimaryAppBar(
              title: project.name,
              leading: IconButton(
                color: AppColor.black,
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body: SafeArea(
                child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16.0),
                  Text("Thành viên",
                      style: AppTextTheme.robotoBold18
                          .copyWith(color: AppColor.primary500)),
                  const SizedBox(height: 8.0),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoute.projectMembers,
                          arguments: ProjectMemberPageArgs(
                              projectId: args.projectId,
                              projectCubit: cubit,
                              projectMembers: project.projectMembers));
                    },
                    child: Row(children: [
                      SvgPicture.asset(
                        Assets.icPeople2,
                        color: AppColor.primary400,
                      ),
                      const Text('   Danh sách thành viên',
                          style: AppTextTheme.robotoMedium16),
                    ]),
                  ),
                  const SizedBox(height: 16.0),
                  Text("Nhiệm vụ",
                      style: AppTextTheme.robotoBold18
                          .copyWith(color: AppColor.primary500)),
                  const SizedBox(height: 8.0),
                  InkWell(
                    onTap: () {},
                    child: Row(children: [
                      SvgPicture.asset(
                        Assets.icPeople2,
                        color: AppColor.primary400,
                      ),
                      const Text('   Danh sách nhiệm vụ',
                          style: AppTextTheme.robotoMedium16),
                    ]),
                  ),
                  const SizedBox(height: 16.0),
                  // Text('Mô tả',
                  //     style: AppTextTheme.robotoBold18
                  //         .copyWith(color: AppColor.primary500)),
                  // const SizedBox(height: 8.0),
                  // Container(
                  //   constraints: BoxConstraints(
                  //       minWidth: context.screenWidth - 32.0,
                  //       minHeight: context.screenWidth / 16 * 9),
                  //   decoration: BoxDecoration(
                  //       border: Border.all(color: AppColor.fourth300),
                  //       borderRadius: BorderRadius.circular(8.0)),
                  //   padding: const EdgeInsets.only(top: 12.0),
                  //   child: Text("Mô tả",
                  //       style: AppTextTheme.robotoRegular14
                  //           .copyWith(color: AppColor.primary500)),
                  // )
                ],
              ),
            )),
          );
        } else {
          return const NoData();
        }
      },
    );
  }
}
