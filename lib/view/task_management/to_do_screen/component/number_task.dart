import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../config/routes.dart';
import '../../../../data/resources/resources.dart';
import '../../../../domain/entity/okr/task/task.dart';
import '../../../../shared/etx/app_ext.dart';

class IhaveTask extends StatelessWidget {
  final bool isDone;
  final List<Task> listTask;
  const IhaveTask({super.key, required this.isDone, required this.listTask});

  @override
  Widget build(BuildContext context) {
    int n = listTask.length;
    return Container(
      height: context.screenHeight / 13,
      width: context.screenWidth,
      decoration: BoxDecoration(
          color: (isDone)
              ? const Color(0xFFDEF2EC)
              : const Color(0xFFD4EEFF), //rgb(212, 238, 255)
          borderRadius: BorderRadius.circular(24)),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, AppRoute.todotask,
              arguments: ToDoArgs(listTask));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                SvgPicture.asset((isDone) ? Assets.icClock : Assets.icLock),
                Text(
                  (isDone)
                      ? "You have $n tasks to complete "
                      : "Oops!!! You lost $n tasks ",
                ),
              ],
            ),
            SvgPicture.asset(Assets.icArrowRight)
          ],
        ),
      ),
    );
  }
}
