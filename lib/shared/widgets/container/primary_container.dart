import 'package:flutter/material.dart';

import '../../../data/resources/resources.dart';

class PrimaryContainer extends StatelessWidget {
  final Widget? child;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderRadius;
  final double? borderWidth;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  const PrimaryContainer(
      {Key? key,
      this.child,
      this.backgroundColor = AppColor.white,
      this.borderColor,
      this.borderRadius = 8,
      this.borderWidth = 1,
      this.padding,
      this.margin,
      this.width,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius!),
        border: borderColor != null
            ? Border.all(color: borderColor!, width: borderWidth!)
            : null,
      ),
      child: child,
    );
  }
}
