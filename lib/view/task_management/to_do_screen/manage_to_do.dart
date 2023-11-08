import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../data/resources/resources.dart';
import '../../../domain/entity/okr/task/task.dart';
import '../../../shared/etx/app_ext.dart';
import '../../base/base_page_sate.dart';
import '../../base/bloc/user/user_cubit.dart';
import '../cubit/task_cubit.dart';

class ManageToDoTask extends StatefulWidget {
  const ManageToDoTask({super.key});

  @override
  State<ManageToDoTask> createState() => _ManageToDoTaskState();
}

class _ManageToDoTaskState extends BasePageState<ManageToDoTask, TaskCubit> {
  List<Task> listTaskDone = [];
  List<Task> listTaskLost = [];
  @override
  EdgeInsets get padding => EdgeInsets.zero;

  @override
  void didChangeDependencies() {
    userCubit.getUser();
    cubit.getAllTask();
    super.didChangeDependencies();
  }

  @override
  Widget buildPage(BuildContext context) {
    return Column(
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
                  return const Text("No data");
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
          listener: (context, state) {
            
          },
          builder: (context, state) {
            if (state is TaskGetAllTaskSuccessState) {
              listTaskDone  = ;
               return SizedBox(
              child: Column(),
            );
            } else {
              return SizedBox(child: Text('No Data'),)
            }
           
          },
        )
      ],
    );
  }
}

class IhaveTask extends StatelessWidget {
  final bool isDone;
  final List<Task> listTask;
  const IhaveTask({super.key, required this.isDone, required this.listTask});

  @override
  Widget build(BuildContext context) {
    int n = listTask.length;
    return Container(
      height: context.screenHeight / 12,
      width: context.screenWidth,
      decoration: BoxDecoration(
          color: (isDone)
              ? const Color.fromARGB(255, 210, 241, 230)
              : const Color.fromARGB(10, 162, 197, 243),
          borderRadius: BorderRadius.circular(24)),
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            SvgPicture.asset((isDone) ? Assets.icClock : Assets.iconAppError),
            Text((isDone)
                ? "You have $n tasks to complete "
                : "Oops!!! You lost $n tasks "),
            SvgPicture.asset(Assets.icArrowRight)
          ],
        ),
      ),
    );
  }
}
