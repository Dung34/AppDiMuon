import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/routes.dart';
import '../../data/resources/colors.dart';
import '../../data/resources/resources.dart';
import '../../shared/etx/app_ext.dart';
import '../../shared/widgets/button/primary_button.dart';
import '../../shared/widgets/button/primary_icon_button.dart';
import '../../shared/widgets/image/primary_image.dart';
import '../../shared/widgets/something/loading.dart';
import '../../shared/widgets/something/no_data.dart';
import '../base/base_page_sate.dart';
import 'cubit/unit_cubit.dart';

class UnitDetailPage extends StatefulWidget {
  const UnitDetailPage({super.key});

  @override
  State<UnitDetailPage> createState() => _UnitDetailPage();
}

class _UnitDetailPage extends BasePageState<UnitDetailPage, UnitCubit> {
  late final UnitDetailPageArgs args;

  @override
  bool get isUseLoading => true;

  @override
  bool get useBlocProviderValue => true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    args = context.arguments as UnitDetailPageArgs;
    setCubit = args.unitCubit;

    cubit.viewUnit(args.id);
  }

  @override
  Widget buildPage(BuildContext context) {
    return BlocBuilder<UnitCubit, UnitState>(
        buildWhen: (previous, current) =>
            current is UnitGetUnitDetailSuccessState ||
            current is UnitResetState,
        builder: (context, state) {
          if (state is UnitGetUnitDetailSuccessState) {
            final unit = state.unit;
            return Scaffold(
              backgroundColor: AppColor.gray50,
              body: Column(
                children: [
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      PrimaryIconButton(
                        context: context,
                        icon: Icons.arrow_back_ios_rounded,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(width: 8.0),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border:
                                Border.all(color: AppColor.green100, width: 1)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: PrimaryNetworkImage(
                            imageUrl: unit.coverImage,
                            height: context.screenWidth * 0.093,
                            width: context.screenWidth * 0.093,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        unit.name ?? '',
                        style: AppTextTheme.robotoBold18
                            .copyWith(color: AppColor.green200),
                      ),
                      const Spacer(),
                      Text('${unit.totalMemberCount}',
                          style: AppTextTheme.robotoMedium14
                              .copyWith(color: AppColor.green200)),
                      PrimaryIconButton(
                          context: context,
                          icon: Assets.icPeople,
                          onPressed: () {}),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Text('Id: ${unit.id}'),
                  Text('Name: ${unit.name}'),
                  Text('Parrent Id: ${unit.parrentId}'),
                  Text('Description: ${unit.description}'),
                  const Text('Cover Image:'),
                  PrimaryNetworkImage(imageUrl: unit.coverImage),
                  Text('Member quantity: ${unit.totalMemberCount}'),
                  Text(
                      'Các unit con (em lười List.generate quá): ${unit.subUnit.toString()}'),
                  Text('OKR id: ${unit.okRsId}'),
                  PrimaryButton(
                    context: context,
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        AppRoute.unitAdd,
                        arguments: unit.id,
                      );
                    },
                    label: 'Thêm unit',
                  ),
                ],
              ),
            );
          } else {
            return const Loading();
          }
        });
  }
}
