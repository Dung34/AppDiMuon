import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/routes.dart';
import '../../../data/resources/colors.dart';
import '../../../data/resources/resources.dart';
import '../../../data/resources/themes.dart';
import '../../../domain/entity/okr/unit/unit.dart';
import '../../../shared/etx/app_ext.dart';
import '../../../shared/widgets/button/primary_icon_button.dart';
import '../../../shared/widgets/image/primary_image.dart';
import '../cubit/unit_cubit.dart';

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
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0), color: AppColor.white),
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
    );
  }
}
