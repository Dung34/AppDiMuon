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

import '../../base/base_page_sate.dart';
import '../../base/bloc/user/user_cubit.dart';

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
  }

  @override
  Widget buildPage(BuildContext context) {
    return SingleChildScrollView(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: context.screenHeight / 12,
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(width: 4, color: Color(0xFFE0E1E2)),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: BlocBuilder<UserCubit, UserState>(
                builder: (context, state) {
                  if (state is UserGetUserSuccessState) {
                    return Row(
                      children: [
                        const CircleAvatar(),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              (state.userEntity.role) == 1
                                  ? "Admin"
                                  : state.userEntity.fullName ?? "",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                            ),
                            const Text(
                              "ID: 92839",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          width: context.screenWidth * 2 / 5,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(Assets.icNotification)),
                        IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(Assets.icSearch))
                      ],
                    );
                  } else {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Không có dữ liệu"),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(Assets.icNotification)),
                            IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(Assets.icSearch))
                          ],
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Text(
              'To-do',
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Lexend'),
            ),
          ),
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: IhaveTask(isDone: true, listTask: listTaskDone),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: IhaveTask(isDone: false, listTask: listTaskLost),
                      )
                    ],
                  ),
                );
              } else {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Text('No Data'),
                );
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: const Color(0xFF6751F2),
                    borderRadius: BorderRadius.circular(24)),
                child: const Text(
                  "My Unit >",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                )),
          ),
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
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    child: SizedBox(
                      width: context.screenWidth - 20,
                      height: context.screenHeight / 6,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => UnitItem2(
                                unit: listUnits[index],
                              ),
                          itemCount: listUnits.length),
                    ),
                  );
                } else {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text("Không có dữ liệu !!!"),
                  );
                }
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "Objectives",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                ),
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    "More  > ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ))
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
                          okrId: listUnits[i].okRsId, unitId: listUnits[i].id);
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
    );
  }
}

class UnitItem2 extends StatelessWidget {
  final Unit unit;
  const UnitItem2({super.key, required this.unit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: context.screenWidth - 50,
        decoration: BoxDecoration(
            border: Border.all(), borderRadius: BorderRadius.circular(24)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: CircleAvatar(),
                ),
                Column(
                  children: [
                    Text(
                      unit.name ?? " ",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    Text(unit.description ?? ""),
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: PrimaryButton(
                  context: context, onPressed: () {}, label: "Update process"),
            )
          ],
        ),
      ),
    );
  }
}
