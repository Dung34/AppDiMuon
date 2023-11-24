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
      height: 50,
      width: context.screenWidth,
      decoration: BoxDecoration(
          color: (isDone)
              ? AppColor.green50
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
                const SizedBox(width: 10),
                SvgPicture.asset((isDone) ? Assets.icClock : Assets.icSecurity),
                isDone
                    ? RichText(
                        text: TextSpan(
                            text: 'You have ',
                            style: AppTextTheme.robotoMedium16,
                            children: <TextSpan>[
                            TextSpan(
                                text: '$n Tasks ',
                                style: AppTextTheme.lexendBold16
                                    .copyWith(color: AppColor.green200)),
                            const TextSpan(
                                text: ' to complete',
                                style: AppTextTheme.robotoMedium16)
                          ]))
                    : RichText(
                        text: TextSpan(
                            text: 'Oops! You lost ',
                            style: AppTextTheme.robotoMedium16,
                            children: <TextSpan>[
                            TextSpan(
                                text: '$n Tasks ',
                                style: AppTextTheme.lexendBold16
                                    .copyWith(color: AppColor.blue200)),
                          ]))
              ],
            ),
            const Spacer(),
            SvgPicture.asset(Assets.icArrowRight),
            const SizedBox(width: 10)
          ],
        ),
      ),
    );
  }
}
