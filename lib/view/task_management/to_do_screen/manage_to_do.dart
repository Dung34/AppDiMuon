import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../data/resources/resources.dart';
import '../../../di/di.dart';
import '../../../domain/entity/okr/objective/objective.dart';
import '../../../domain/entity/okr/task/task.dart';
import '../../../domain/entity/okr/unit/unit.dart';
import '../../../shared/etx/app_ext.dart';
import '../../../shared/widgets/button/primary_button.dart';
import '../../../shared/widgets/dropdown/base_dropdown_value.dart';

import '../../../shared/widgets/image/primary_image.dart';
import '../../../shared/widgets/something/no_data.dart';
import '../../base/base_page_sate.dart';
import '../../base/bloc/user/user_cubit.dart';

import '../../okr_page/component/key_result_item.dart';
import '../../okr_page/component/objective_item.dart';
import '../../okr_page/cubit/okr_cubit.dart';
import '../../unit_page/cubit/unit_cubit.dart';
import '../cubit/task_cubit.dart';
import 'component/number_task.dart';

class ManageToDoTask extends StatefulWidget {
  const ManageToDoTask({super.key});

  @override
  State<ManageToDoTask> createState() => _ManageToDoTaskState();
}

class _ManageToDoTaskState extends BasePageState<ManageToDoTask, TaskCubit> {
  List<Task> listTaskDone = [];
  List<Task> listTaskLost = [];
  List<Objective> listObj = [];
  List<Unit> listUnits = [];
  OkrCubit okrCubit = getIt.get<OkrCubit>();
  UnitCubit unitCubit = getIt.get();
  @override
  EdgeInsets get padding => EdgeInsets.zero;
  List<BaseDropdownValue> listItem = [
    const BaseDropdownValue(valueStr: "TrueConnect"),
    const BaseDropdownValue(valueStr: "Eztek"),
    const BaseDropdownValue(valueStr: "Active +")
  ];

  @override
  void didChangeDependencies() {
    userCubit.getUser();
    cubit.getAllTask();

    super.didChangeDependencies();

    unitCubit.getAllUnit();
    okrCubit.getAllObjectives();
    listTaskDone.clear();
    listTaskLost.clear();
    listObj.clear();
    listUnits.clear();

    setAppBar = AppBar(
      actions: [
        IconButton(
            onPressed: () {}, icon: SvgPicture.asset(Assets.icNotification)),
        IconButton(onPressed: () {}, icon: SvgPicture.asset(Assets.icSearch))
      ],
      backgroundColor: AppColor.white,
      leading: BlocBuilder<UserCubit, UserState>(builder: (context, state) {
        return state is UserGetUserSuccessState
            ? CircleAvatar(
                child: PrimaryNetworkImage(
                imageUrl: state.userEntity.avatar,
                height: context.screenWidth * 0.108,
                width: context.screenWidth * 0.108,
              ))
            : Container();
      }),
      title: BlocBuilder<UserCubit, UserState>(builder: (context, state) {
        return state is UserGetUserSuccessState
            ? Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          (state.userEntity.role) == 1
                              ? "Admin"
                              : state.userEntity.fullName ?? "",
                          style: AppTextTheme.robotoBold16),
                      Text("ID: ${state.userEntity.id}",
                          style: AppTextTheme.robotoLight12)
                    ],
                  ),
                ],
              )
            : Container();
      }),
      toolbarHeight: context.screenHeight / 12,
    );
  }

  @override
  Widget buildPage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('To-do',
                style: AppTextTheme.lexendBold24
                    .copyWith(color: AppColor.green400)),
            BlocConsumer<TaskCubit, TaskState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is TaskGetAllTaskSuccessState) {
                  int n = state.taskList.length;
                  for (var i = 0; i < n; i++) {
                    if (state.taskList[i].status == 0) {
                      listTaskDone.add(state.taskList[i]);
                    }

                    if (state.taskList[i].status == 1) {
                      listTaskLost.add(state.taskList[i]);
                    }
                  }
                  return SizedBox(
                    child: Column(
                      children: [
                        IhaveTask(isDone: true, listTask: listTaskDone),
                        const SizedBox(height: 10),
                        IhaveTask(isDone: false, listTask: listTaskLost)
                      ],
                    ),
                  );
                } else {
                  return const Text('No Data');
                }
              },
            ),
            const SizedBox(height: 15),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              PrimaryButton(
                backgroundColor: AppColor.purple,
                contentPadding: 0,
                context: context,
                label: '   Units',
                onPressed: () {},
                rightIcon: SvgPicture.asset(Assets.icArrowRight,
                    color: AppColor.white),
                textStyle:
                    AppTextTheme.lexendBold16.copyWith(color: AppColor.white),
              ),
            ]),
            const SizedBox(height: 15),
            BlocProvider(
              create: (context) => unitCubit,
              child: BlocConsumer<UnitCubit, UnitState>(
                listener: (context, state) {
                  if (listUnits.isEmpty) {
                    unitCubit.getAllUnit();
                    if (state is UnitGetAllUnitSuccessState) {
                      listUnits = state.units;
                    }
                  }
                },
                builder: (context, state) {
                  if (state is UnitGetAllUnitSuccessState) {
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 1,
                                color: AppColor.black.withOpacity(0.1),
                                offset: const Offset(1, 1),
                                spreadRadius: 1)
                          ],
                          color: AppColor.white),
                      height: context.screenHeight * 165 / 926,
                      padding: const EdgeInsets.all(12),
                      child: CarouselSlider(
                          items:
                              listUnits.map((e) => UnitItem2(unit: e)).toList(),
                          options: CarouselOptions(
                              aspectRatio: 16 / 9,
                              autoPlay: true,
                              autoPlayInterval: const Duration(seconds: 5),
                              height: 400,
                              viewportFraction: 1)),
                    );
                  } else {
                    return const NoData();
                  }
                },
              ),
            ),
            const SizedBox(height: 8),
            Text('Fulfill',
                style: AppTextTheme.lexendBold24
                    .copyWith(color: AppColor.green400)),
            Center(child: Image.asset(Assets.imPlantGrowingUp)),
            const SizedBox(height: 12),
            Center(
              child: RichText(
                text: TextSpan(
                    text: 'YOUR PLAN ',
                    style: AppTextTheme.lexendBold24
                        .copyWith(color: AppColor.green400),
                    children: const <TextSpan>[
                      TextSpan(
                          text: 'IS GROW UP', style: AppTextTheme.lexendBold24)
                    ]),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Objectives",
                    style: AppTextTheme.lexendBold24
                        .copyWith(color: AppColor.green400)),
                TextButton(
                    onPressed: () {},
                    child: const Text("More  > ",
                        style: AppTextTheme.robotoMedium16))
              ],
            ),
            BlocProvider(
              create: (context) => okrCubit,
              child: SizedBox(
                width: context.screenWidth,
                height: context.screenHeight * 0.5,
                child: BlocConsumer<OkrCubit, OkrState>(
                  listener: (context, state) {
                    if (listObj.isEmpty) {
                      for (var i = 0; i < listUnits.length; i++) {
                        okrCubit.getAllObjectives(
                            okrId: listUnits[i].okRsId,
                            unitId: listUnits[i].id);
                        if (state is OkrGetAllObjectivesSuccessState) {
                          listObj.addAll(state.objectives!);
                        }
                      }
                    }
                  },
                  builder: (context, state) {
                    if (state is OkrGetAllObjectivesSuccessState) {
                      return ListView.builder(
                        itemBuilder: (context, index) => ObjectiveItem(
                            objective: listObj[index],
                            cubit: okrCubit,
                            isAdmin: false),
                      );
                    } else {}
                    return const Center(
                      child: Text("Không có dữ liệu !!!!"),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class UnitItem2 extends StatelessWidget {
  final Unit unit;
  const UnitItem2({super.key, required this.unit});

  @override
  Widget build(BuildContext context) {
    double percent = ((unit.taskDone ?? 0) + 0.0) /
        (unit.totalTask == null || unit.totalTask == 0 ? 1 : unit.totalTask!);

    return Container(
      constraints: BoxConstraints(maxWidth: context.screenWidth - 36),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 9),
          Row(
            children: [
              const SizedBox(width: 9),
              CircularPercentIndicator(
                center: Text('${(percent * 100).floor()}%',
                    style: AppTextTheme.robotoBold18),
                lineWidth: 9,
                percent: percent,
                radius: 44,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(unit.name ?? " ", style: AppTextTheme.lexendBold18),
                  Text(unit.description ?? "",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextTheme.robotoLight12),
                ],
              )
            ],
          ),
          const SizedBox(height: 16),
          PrimaryButton(
              context: context, onPressed: () {}, label: "Update process")
        ],
      ),
    );
  }
}
