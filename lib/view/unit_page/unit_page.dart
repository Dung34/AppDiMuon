import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../base/base_page_sate.dart';
import '../../shared/widgets/button/primary_button.dart';
import '../okr_page/cubit/okr_cubit.dart';
import 'cubit/unit_cubit.dart';

class UnitPage extends StatefulWidget {
  const UnitPage({super.key});

  @override
  State<UnitPage> createState() => _UnitPageState();
}

class _UnitPageState extends BasePageState<UnitPage, UnitCubit> {
  @override
  void initState() {
    super.initState();
    cubit.getAllUnit();
  }

  @override
  Widget buildPage(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 200,
        height: 100,
        child: BlocBuilder<UnitCubit, UnitState>(
          builder: (context, state) {
            return PrimaryButton(
                context: context,
                onPressed: () {
                  if (state is UnitGetAllUnitSuccessState) {}
                },
                label: 'Bấm vào đây đi');
          },
        ),
      ),
    );
  }
}
