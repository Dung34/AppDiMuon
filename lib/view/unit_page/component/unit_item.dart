import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../config/routes.dart';
import '../../../data/resources/resources.dart';
import '../../../domain/entity/okr/unit/unit.dart';
import '../../../shared/etx/app_ext.dart';
import '../../../shared/widgets/image/primary_image.dart';
import '../cubit/unit_cubit.dart';
import '../unit_update_page.dart';

class UnitItem extends StatefulWidget {
  final Unit unit;
  final UnitCubit cubit;

  const UnitItem({super.key, required this.unit, required this.cubit});

  @override
  State<UnitItem> createState() => _UnitItemState();
}

class _UnitItemState extends State<UnitItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoute.unitDetail,
            arguments: UnitDetailPageArgs(
              id: widget.unit.id!,
              unitCubit: context.read<UnitCubit>(),
            ));
      },
      child: Slidable(
        endActionPane: ActionPane(
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
        ),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: AppColor.white),
            height: context.screenWidth * 0.25,
            padding: const EdgeInsets.all(10.0),
            width: context.screenWidth - 20,
            child: Row(children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: AppColor.green100, width: 1)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: PrimaryNetworkImage(
                    imageUrl: widget.unit.coverImage,
                    height: context.screenWidth * 0.093,
                    width: context.screenWidth * 0.093,
                  ),
                ),
              ),
              const SizedBox(width: 16.0),
              Flexible(
                flex: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.unit.name ?? '',
                      overflow: TextOverflow.ellipsis,
                      style: AppTextTheme.robotoBold24,
                    ),
                    Text(
                      '${widget.unit.totalMemberCount} thành viên',
                      style: AppTextTheme.robotoLight12,
                    ),
                  ],
                ),
              ),
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
