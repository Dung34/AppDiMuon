import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../data/resources/colors.dart';
import '../something/bouncing.dart';

class PrimaryIconButton extends StatelessWidget {
  const PrimaryIconButton({
    super.key,
    required this.context,
    required this.onPressed,
    this.backgroundColor = AppColor.primaryBackgroundColor,
    this.iconColor = Colors.black,
    this.borderColor,
    this.icon,
    this.isClickable = true,
    this.isCircle = false,
  });

  final BuildContext context;
  final Function() onPressed;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? borderColor;
  final dynamic icon;
  final bool isClickable;
  final bool isCircle;

  @override
  Widget build(BuildContext context) {
    return Bouncing(
        child: TextButton(
      onPressed: onPressed,
      style: const ButtonStyle(
        padding: MaterialStatePropertyAll(EdgeInsets.zero),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: MaterialStatePropertyAll(Size(21.5, 21.5)),
      ),
      child: icon == null
          ? Container()
          : icon is String
              ? SvgPicture.asset(
                  icon,
                  color: iconColor,
                  width: 20,
                  height: 20,
                )
              : Icon(icon, size: 20, color: iconColor),
    ));
  }
}
