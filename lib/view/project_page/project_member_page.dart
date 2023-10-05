import 'package:flutter/material.dart';

import '../../data/constant/constants.dart';
import '../../domain/entity/user/user.dart';
import '../base/base_page_sate.dart';
import '../event_page/components/event_dropdown_button.dart';
import '../../config/routes.dart';
import '../../data/resources/resources.dart';
import '../../domain/entity/project/project.dart';
import '../../shared/etx/app_ext.dart';
import '../../shared/widgets/button/primary_button.dart';
import '../../shared/widgets/image/primary_circle_image.dart';
import '../../shared/widgets/something/primary_app_bar.dart';
import 'cubit/project_cubit.dart';

class ProjectMemberPage extends StatefulWidget {
  const ProjectMemberPage({super.key});

  @override
  State<ProjectMemberPage> createState() => _ProjectMemberPageState();
}

class _ProjectMemberPageState
    extends BasePageState<ProjectMemberPage, ProjectCubit> {
  late final ProjectMemberPageArgs args;
  late List<ProjectMember>? projectMembers;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    args = context.arguments as ProjectMemberPageArgs;
    projectMembers = args.projectMembers;

    setCubit = args.projectCubit;
  }

  void addMember() {
    TextEditingController nameController = TextEditingController();
    String? selectedTab;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0)),
            title: const Center(
                child:
                    Text('Thêm thành viên', style: AppTextTheme.robotoBold18)),
            content: SizedBox(
              height: 100,
              child: Column(
                children: [
                  Row(children: [
                    const Text('Tên thành viên',
                        style: AppTextTheme.robotoMedium14),
                    const Spacer(),
                    SizedBox(
                      height: 30,
                      width: context.screenWidth / 3,
                      child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            hintStyle: AppTextTheme.robotoRegular14
                                .copyWith(color: AppColor.primary300),
                            hintText: 'Abc'),
                      ),
                    ),
                  ]),
                  const SizedBox(height: 16.0),
                  Row(
                    children: [
                      const Text('Vai trò', style: AppTextTheme.robotoMedium14),
                      const Spacer(),
                      SizedBox(
                        width: context.screenWidth / 3,
                        child: EventDropdownButton(
                            buttonStyle: AppTextTheme.robotoRegular14,
                            isExpanded: true,
                            itemStyle: AppTextTheme.robotoRegular12,
                            onChanged: (value) {
                              setState(() {
                                selectedTab = value;
                              });
                            },
                            tabs: const ['Quản trị viên', 'Người dùng'],
                            value: selectedTab),
                      )
                    ],
                  )
                ],
              ),
            ),
            actions: [
              Center(
                child: Container(
                    constraints:
                        BoxConstraints(maxWidth: context.screenWidth / 3),
                    child: PrimaryButton(
                        context: context,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        label: 'Thêm')),
              ),
            ],
          );
        });
      },
    );
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
      body: Stack(children: [
        GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            childAspectRatio: 16 / 9,
            crossAxisSpacing: 10,
            maxCrossAxisExtent: context.screenWidth / 2,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return FutureBuilder<UserEntity>(
              future:
                  userCubit.getUserById(userId: projectMembers![index].userId),
              builder: (context, AsyncSnapshot<UserEntity> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container();
                } else {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return MemberItem(
                        memberName: snapshot.data!.fullName ?? 'Unknown',
                        role: projectMembers![index].role ?? 0);
                  }
                }
              },
            );
          },
          itemCount: projectMembers?.length,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    colors: [
                      AppColor.white,
                      Color.fromRGBO(255, 255, 255, 0.5)
                    ],
                    end: Alignment.topCenter)),
            height: 70,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: context.screenWidth / 3),
                height: 40,
                child: userCubit.currentUser?.role == UserRole.user
                    ? PrimaryButton(
                        context: context,
                        onPressed: addMember,
                        label: 'Thêm thành viên')
                    : Container(),
              ),
              const SizedBox(height: 20),
            ],
          ),
        )
      ]),
    );
  }
}

class MemberItem extends StatelessWidget {
  final String memberName;
  final int role;

  const MemberItem({
    super.key,
    required this.memberName,
    required this.role,
  });

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
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(memberName, style: AppTextTheme.robotoBold16),
            const SizedBox(height: 8.0),
            Text(role == 0 ? 'Thành viên' : 'Quản trị viên')
          ],
        ),
      ],
    );
  }
}
