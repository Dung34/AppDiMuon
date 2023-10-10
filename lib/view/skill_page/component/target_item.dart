import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/routes.dart';
import '../../../domain/entity/target/target.dart';
import '../../base/bloc/target/target_cubit.dart';

class TargetItem extends StatelessWidget {
  final Target target;
  const TargetItem({super.key, required this.target});

  @override
  Widget build(BuildContext context) {
    final TargetCubit targetCubit = context.read<TargetCubit>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        child: Container(
          margin: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.purple, width: 1.0),
              borderRadius: BorderRadius.circular(16)),
          child: Row(
            children: [
              Text(target.title ?? ""),
              Text(target.targe.toString()),
              IconButton(
                  onPressed: () {
                    targetCubit.deleteTarget(target.id ?? "");
                  },
                  icon: Icon(Icons.delete)),
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoute.targetUpdatePage,
                        arguments: TargetPageArgs(
                            addNew: false,
                            targetCubit: targetCubit,
                            target: target));
                  },
                  icon: Icon(Icons.edit))
            ],
          ),
        ),
      ),
    );
  }
}
