import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../config/routes.dart';
import '../../../domain/entity/target/target.dart';
import '../../base/bloc/target/target_cubit.dart';

class TargetItem extends StatelessWidget {
  final Target target;
  const TargetItem({super.key, required this.target});

  @override
  Widget build(BuildContext context) {
    final TargetCubit targetCubit = context.read<TargetCubit>();
    return Slidable(
      key: const ValueKey(0),
      endActionPane: ActionPane(motion: ScrollMotion(), children: [
        SlidableAction(
          onPressed: (context) {
            targetCubit.deleteTarget(target.id ?? " ");
          },
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          icon: Icons.delete,
        )
      ]),
      child: ListTile(
        onTap: () => Navigator.pushNamed(context, AppRoute.targetUpdatePage,
            arguments: TargetPageArgs(
                addNew: false, targetCubit: targetCubit, target: target)),
        title: Text(
          target.title ?? " ",
        ),
        subtitle: Text(target.description ?? " "),
        trailing: Text(target.status.toString()),
      ),
    );
  }
}
