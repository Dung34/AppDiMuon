import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final Color? backgroundColor;
  final BorderRadiusGeometry? borderRadius;
  final Widget? child;
  final BuildContext context;
  final int? hasOccurred;
  final double? height;
  final Function() onPressed;
  final EdgeInsetsGeometry? padding;
  final double? width;

  const SecondaryButton({
    super.key,
    this.backgroundColor,
    this.borderRadius,
    this.child,
    required this.context,
    this.hasOccurred,
    this.height,
    required this.onPressed,
    this.padding,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(height: height, width: width),
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          padding: MaterialStateProperty.all(padding),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(36.0),
            ),
          ),
        ),
        child: child ?? const Text(''),
      ),
    );
  }
}
