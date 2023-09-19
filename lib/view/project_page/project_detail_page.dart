import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../data/resources/colors.dart';
import '../../data/resources/resources.dart';
import '../../data/resources/themes.dart';
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
  @override
  Widget buildPage(BuildContext context) {
    return BlocBuilder<ProjectCubit, ProjectState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColor.primaryBackgroundColor,
          appBar: PrimaryAppBar(
            title: "Chi tiết dự án",
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
                const SizedBox(
                  height: 16.0,
                ),
                Text("Thành viên",
                    style: AppTextTheme.robotoBold18
                        .copyWith(color: AppColor.primary500)),
                const SizedBox(height: 8.0),
                GestureDetector(
                  onTap: () {},
                  child: Row(children: [
                    SvgPicture.asset(
                      Assets.icPeople2,
                      color: AppColor.primary400,
                    ),
                    const Text(
                      '   Danh sách thành viên',
                      style: AppTextTheme.robotoMedium16,
                    ),
                  ]),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Text("Nhiệm vụ",
                    style: AppTextTheme.robotoBold18
                        .copyWith(color: AppColor.primary500)),
                const SizedBox(height: 8.0),
                GestureDetector(
                  onTap: () {},
                  child: Row(children: [
                    SvgPicture.asset(
                      Assets.icPeople2,
                      color: AppColor.primary400,
                    ),
                    const Text(
                      '   Danh sách nhiệm vụ',
                      style: AppTextTheme.robotoMedium16,
                    ),
                  ]),
                ),
                const SizedBox(height: 16.0),
                Text('Mô tả',
                    style: AppTextTheme.robotoBold18
                        .copyWith(color: AppColor.primary500)),
              ],
            ),
          )),
        );
      },
    );
  }
}
