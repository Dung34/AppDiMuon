import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../config/routes.dart';
import '../../../data/constant/constants.dart';
import '../../../data/resources/resources.dart';
import '../../../domain/entity/okr/unit/unit.dart';
import '../../../shared/etx/app_ext.dart';
import '../../../shared/utils/date_time_utils.dart';
import '../../base/bloc/user/user_cubit.dart';
import '../../okr_page/component/key_result_item.dart';
import '../cubit/unit_cubit.dart';
import '../unit_update_page.dart';

class UnitItem extends StatefulWidget {
  final Unit unit;
  final UnitCubit cubit;
  final bool isAdmin;

  const UnitItem(
      {super.key,
      required this.unit,
      required this.cubit,
      required this.isAdmin});

  @override
  State<UnitItem> createState() => _UnitItemState();
}

class _UnitItemState extends State<UnitItem> {
  final UserCubit userCubit = UserCubit();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoute.unitDetail,
            arguments:
                UnitDetailPageArgs(unit: widget.unit, isAdmin: widget.isAdmin));
      },
      child: Slidable(
        endActionPane: widget.isAdmin
            ? ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    autoClose: true,
                    backgroundColor: AppColor.blue200,
                    borderRadius: BorderRadius.circular(10.0),
                    flex: 1,
                    foregroundColor: AppColor.white,
                    icon: Icons.edit,
                    label: 'Sửa Unit',
                    onPressed: (context) {
                      _onUpdateUnitPressed();
                    },
                  ),
                  const SizedBox(width: 10.0),
                  SlidableAction(
                    autoClose: true,
                    backgroundColor: AppColor.red200,
                    borderRadius: BorderRadius.circular(10.0),
                    flex: 1,
                    foregroundColor: AppColor.white,
                    icon: Icons.delete,
                    label: 'Xóa Unit',
                    onPressed: (context) {
                      widget.cubit.deleteUnit(widget.unit.id!);
                    },
                  )
                ],
              )
            : null,
        child: Center(
          child: Container(
            constraints: BoxConstraints(minHeight: context.screenWidth * 0.25),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 1,
                      color: Colors.black.withOpacity(0.1),
                      offset: const Offset(1, 1),
                      spreadRadius: 1),
                ],
                color: AppColor.white),
            padding: const EdgeInsets.all(16),
            width: context.screenWidth - 20,
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              // Container(
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(10.0),
              //       border: Border.all(color: AppColor.green100, width: 1)),
              //   child: ClipRRect(
              //     borderRadius: BorderRadius.circular(10),
              //     child: PrimaryNetworkImage(
              //       imageUrl: widget.unit.coverImage,
              //       height: context.screenWidth * 0.093,
              //       width: context.screenWidth * 0.093,
              //     ),
              //   ),
              // ),
              Flexible(
                flex: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    statusText[1],
                    const SizedBox(height: 6),
                    Text(widget.unit.name ?? '',
                        overflow: TextOverflow.ellipsis,
                        style: AppTextTheme.lexendBold18),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Expanded(
                          flex: 77,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Owner', style: AppTextTheme.lexendLight12),
                              SizedBox(height: 4),
                              Text('Start Date',
                                  style: AppTextTheme.lexendLight12),
                              SizedBox(height: 4),
                              Text('End Date',
                                  style: AppTextTheme.lexendLight12),
                              SizedBox(height: 4),
                              Text('Target', style: AppTextTheme.lexendLight12),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 196,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('${widget.unit.owner}',
                                  style: AppTextTheme.lexendRegular12),
                              const SizedBox(height: 4),
                              Text(
                                  DateTimeUtils.formatDate(
                                      '${widget.unit.startDate}',
                                      showTime: false),
                                  style: AppTextTheme.lexendRegular12),
                              const SizedBox(height: 4),
                              Text(
                                  DateTimeUtils.formatDate(
                                      '${widget.unit.startDate}',
                                      showTime: false),
                                  style: AppTextTheme.lexendRegular12),
                              const SizedBox(height: 4),
                              const Text('40/50 KRs',
                                  style: AppTextTheme.lexendRegular12)
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  const SizedBox(height: 8),
                  CircularPercentIndicator(
                    center: Text(
                      '65%',
                      style: AppTextTheme.robotoBold16,
                    ),
                    lineWidth: 9,
                    percent: 0.65,
                    progressColor: AppColor.green200,
                    radius: 50,
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }

  _onUpdateUnitPressed() {
    context.showAppBottomSheet(
        UnitUpdatePage(cubit: widget.cubit, unit: widget.unit));
  }
}
