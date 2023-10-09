import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../base/base_page_sate.dart';
import '../../shared/widgets/button/primary_button.dart';
import '../okr_page/cubit/okr_cubit.dart';

class OKRPage extends StatefulWidget {
  const OKRPage({super.key});

  @override
  State<OKRPage> createState() => _OKRPageState();
}

class _OKRPageState extends BasePageState<OKRPage, OkrCubit> {
  @override
  Widget buildPage(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            width: 200,
            height: 100,
            child: BlocBuilder<OkrCubit, OkrState>(
              builder: (context, state) {
                return PrimaryButton(
                    context: context,
                    onPressed: () async {
                      // await cubit.createObjective(
                      //     title: "nothing",
                      //     okrsId: '35b26cc8-43e3-43b8-bc70-e74cbd4570b4',
                      //     unitId: 'c48d7f37-8311-4741-911f-5e259ef22603');
                      if (state is OkrCreateObjectiveSuccessState) {
                        print(state.objective.toString());
                      }
                    },
                    label: 'Bấm vào đây đi');
              },
            ),
          ),
        ],
      ),
    );
  }
}
