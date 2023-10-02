import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/widgets/button/primary_button.dart';
import '../base/base_page_sate.dart';
import 'unit_cubit.dart';

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
                  c  ubit.createUnit(
                      name: "metmoi",
                      parrentId: null,
                      description: "met vler",
                      coverImage: "tim anh lam gi");
                  if (state is UnitCreateUnitSuccessState) {
                    print(state.unit.toString());
                  }
                },
                label: 'Bấm vào đây đi');
          },
        ),
      ),
    );
  }
}
