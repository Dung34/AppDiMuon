import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/routes.dart';
import '../../data/constant/constants.dart';
import '../../data/resources/resources.dart';
import '../../domain/entity/okr/unit/unit.dart';
import '../../shared/etx/app_ext.dart';
import '../../shared/widgets/button/primary_icon_button.dart';
import '../../shared/widgets/list_view/animation_listview.dart';
import '../../shared/widgets/something/no_data.dart';
import '../base/base_page_sate.dart';
import 'component/unit_dropdown_button.dart';
import 'component/unit_item.dart';
import 'cubit/unit_cubit.dart';

class UnitPage extends StatefulWidget {
  const UnitPage({super.key});

  @override
  State<UnitPage> createState() => _UnitPageState();
}

class _UnitPageState extends BasePageState<UnitPage, UnitCubit> {
  final ScrollController scrollController = ScrollController();
  // final TenantCubit tenantCubit = TenantCubit();

  String? statusSelectedTab, ownerSelectedTab, processingSelectedTab;

  @override
  EdgeInsets get padding => EdgeInsets.zero;

  @override
  void initState() {
    super.initState();
    cubit.getAllUnit();
    userCubit.getUser();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // tenantCubit.getTenantDetail();
  }

  @override
  Widget buildPage(BuildContext context) {
    List<Unit> units = [];

    return Stack(
      children: [
        Positioned(
            left: -20,
            top: context.screenHeight * 0.19,
            child: Image.asset(Assets.bgUnitPage,
                height: context.screenHeight * 0.322,
                width: context.screenWidth * 0.38)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 2, color: AppColor.fourth300)),
                color: AppColor.white,
              ),
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text('Units', style: AppTextTheme.lexendBold18),
                        const SizedBox(height: 16),
                        Row(children: [
                          const SizedBox(width: 4),
                          Container(
                            constraints: const BoxConstraints(maxHeight: 36),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: AppColor.gray50),
                            padding: const EdgeInsets.only(left: 4, right: 4),
                            child: UnitDropdownButton(
                              buttonStyle: AppTextTheme.robotoMedium14,
                              dropdownColor: AppColor.white,
                              hint: const Text('Status',
                                  style: AppTextTheme.robotoMedium14),
                              itemStyle: AppTextTheme.robotoMedium14,
                              onChanged: (value) {
                                setState(() {
                                  statusSelectedTab = value;

                                  if (statusSelectedTab == "Status") {
                                    cubit.getAllUnit(owner: ownerSelectedTab);
                                  } else {
                                    for (int i = 1;
                                        i < statusTabs.length;
                                        i++) {
                                      if (statusTabs[i] == statusSelectedTab) {
                                        cubit.getAllUnit(
                                            status: i, owner: ownerSelectedTab);
                                        break;
                                      }
                                    }
                                  }
                                });
                              },
                              tabs: statusTabs,
                              underline: Container(),
                              value: statusSelectedTab,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            constraints: const BoxConstraints(maxHeight: 36),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: AppColor.gray50),
                            padding: const EdgeInsets.only(left: 4, right: 4),
                            child: UnitDropdownButton(
                              buttonStyle: AppTextTheme.robotoMedium14,
                              dropdownColor: AppColor.white,
                              hint: const Text('Owner',
                                  style: AppTextTheme.robotoMedium14),
                              itemStyle: AppTextTheme.robotoMedium14,
                              onChanged: (value) {
                                setState(() {
                                  ownerSelectedTab = value;
                                });
                              },
                              tabs: ownerTabs,
                              underline: Container(),
                              value: ownerSelectedTab,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            constraints: const BoxConstraints(maxHeight: 36),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: AppColor.gray50),
                            padding: const EdgeInsets.only(left: 4, right: 4),
                            child: UnitDropdownButton(
                              buttonStyle: AppTextTheme.robotoMedium14,
                              dropdownColor: AppColor.white,
                              hint: const Text('Processing',
                                  style: AppTextTheme.robotoMedium14),
                              itemStyle: AppTextTheme.robotoMedium14,
                              onChanged: (value) {
                                setState(() {
                                  processingSelectedTab = value;
                                });
                              },
                              tabs: processingTabs,
                              underline: Container(),
                              value: processingSelectedTab,
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Spacer(),
                        ]),
                      ],
                    ),
                  ),
                  const SizedBox(width: 5.0),
                  userCubit.currentUser?.role == UserRole.admin
                      ? PrimaryIconButton(
                          context: context,
                          icon: Assets.icAdd,
                          iconColor: AppColor.primary500,
                          onPressed: () {
                            Navigator.pushNamed(context, AppRoute.unitAdd,
                                arguments: UnitAddPageArgs(cubit: cubit));
                          },
                        )
                      : Container()
                ],
              ),
            ),
            // BlocProvider(
            //   create: (context) => tenantCubit,
            //   child: BlocBuilder<TenantCubit, TenantState>(
            //     buildWhen: (previous, current) =>
            //         current is TenantInitial ||
            //         current is GetTenantDetailSuccessState,
            //     builder: (context, state) {
            //       if (state is GetTenantDetailSuccessState) {
            //         return Row(
            //           children: [
            //             const SizedBox(width: 12),
            //             Text(
            //               state.tenant.tenantName!,
            //               style: AppTextTheme.lexendBold24,
            //             )
            //           ],
            //         );
            //       } else {
            //         return Container();
            //       }
            //     },
            //   ),
            // ),
            Expanded(
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
                      units
                          .removeWhere((element) => element.id == state.unitId);
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (units.isNotEmpty) {
                      final bool isAdmin =
                          userCubit.currentUser?.role == UserRole.admin;
                      final items = List.generate(units.length, (index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            UnitItem(
                              unit: units[index],
                              cubit: cubit,
                              isAdmin: isAdmin,
                            ),
                            const SizedBox(height: 24),
                          ],
                        );
                      });
                      return Padding(
                        padding: const EdgeInsets.all(16),
                        child: AnimationStaggeredListView(
                          items: items,
                          onRefresh: () async {
                            cubit.getAllUnit();
                          },
                        ),
                      );
                    } else {
                      return const NoData();
                    }
                  }),
            )
          ],
        ),
      ],
    );
  }
}
