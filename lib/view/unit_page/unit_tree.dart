import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/resources/resources.dart';
import '../../domain/entity/okr/unit/unit.dart';
import '../../shared/widgets/something/no_data.dart';
import '../base/base_page_sate.dart';
import 'component/unit_item.dart';
import 'cubit/unit_cubit.dart';

class UnitTree extends StatefulWidget {
  const UnitTree({super.key});

  @override
  State<UnitTree> createState() => _UnitTreeState();
}

class _UnitTreeState extends BasePageState<UnitTree, UnitCubit> {
  final ScrollController scrollController = ScrollController();

  @override
  EdgeInsets get padding => EdgeInsets.zero;

  @override
  void initState() {
    super.initState();
    cubit.getAllUnit();
    userCubit.getUser();
  }

  @override
  Widget buildPage(BuildContext context) {
    List<Unit> units = [];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12.0),
        const Row(
          children: [
            SizedBox(width: 10.0),
            Text('True Active+', style: AppTextTheme.lexendBold24),
          ],
        ),
        const SizedBox(height: 12.0),
        Expanded(
          child: BlocProvider(
            create: (context) => UnitCubit(),
            child: BlocBuilder<UnitCubit, UnitState>(
                buildWhen: (previous, current) =>
                    current is UnitGetAllUnitSuccessState ||
                    current is UnitCreateUnitSuccessState ||
                    current is UnitInitialState ||
                    current is UnitDeleteUnitSuccessState,
                builder: (context, state) {
                  if (state is UnitGetAllUnitSuccessState) {
                    units = state.units;
                  } else if (state is UnitCreateUnitSuccessState) {
                    units.add(state.unit);
                  } else if (state is UnitDeleteUnitSuccessState) {
                    units.removeWhere((element) => element.id == state.unitId);
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (units.isNotEmpty) {
                    final items = List.generate(units.length, (index) {
                      return ListUnit(unit: units[index]);
                    });

                    return SingleChildScrollView(
                        child: Column(children: items));
                  } else {
                    return const NoData();
                  }
                }),
          ),
        )
      ],
    );
  }
}

// ignore: must_be_immutable
class ListUnit extends StatelessWidget {
  final Unit unit;
  UnitCubit cubit = UnitCubit();

  ListUnit({super.key, required this.unit});

  @override
  Widget build(BuildContext context) {
    cubit.viewUnit(unit.id ?? '');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        UnitItem(
          unit: unit,
          cubit: cubit,
          isAdmin: false,
        ),
        const SizedBox(height: 24),
        BlocBuilder(
          buildWhen: (previous, current) =>
              current is UnitGetUnitDetailSuccessState,
          builder: (context, state) {
            if (state is UnitGetUnitDetailSuccessState) {
              List.generate(
                  state.unit.subUnit?.length ?? 0,
                  (index) => Column(
                        children: [
                          const SizedBox(height: 5),
                          UnitItem(
                              unit: state.unit.subUnit![index],
                              cubit: cubit,
                              isAdmin: false)
                        ],
                      ));
            }
            return Container();
          },
        )
      ],
    );
  }
}
