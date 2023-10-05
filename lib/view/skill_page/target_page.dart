import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entity/target/target.dart';
import '../../shared/widgets/something/primary_app_bar.dart';
import '../base/base_page_sate.dart';
import '../base/bloc/target/target_cubit.dart';

class TargetPage extends StatefulWidget {
  const TargetPage({super.key});

  @override
  State<TargetPage> createState() => _TargetPageState();
}

class _TargetPageState extends BasePageState<TargetPage, TargetCubit> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    cubit.getAllTarget();
    listTarget = cubit.listTarget;
    setAppBar = PrimaryAppBar(
      title: "Danh sách mục tiêu",
      actions: [],
    );
  }

  late List<Target> listTarget;
  @override
  Widget buildPage(BuildContext context) {
    return BlocConsumer<TargetCubit, TargetState>(
      builder: (context, state) {
        return SizedBox();
      },
      listener: (context, state) {},
    );
  }
}

class TargetItem extends StatelessWidget {
  final Target target;
  const TargetItem({super.key, required this.target});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TargetCubit(),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: SizedBox(
          child: Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                    color: Colors.purple,
                    style: BorderStyle.solid,
                    width: 1.0)),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(target.title ?? ""),
                    Text(target.description ?? "")
                  ],
                ),
                IconButton(
                    onPressed: () {
                      TargetCubit().deleteTarget(target.id ?? " ");
                    },
                    icon: Icon(Icons.delete))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
