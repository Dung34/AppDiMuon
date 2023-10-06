import 'package:flutter/material.dart';

import '../../data/resources/colors.dart';

extension BuildContextExt on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;
  dynamic get arguments => ModalRoute.of(this)?.settings.arguments;

  dynamic showAppDialog(Dialog dialog, {bool barrierDismissible = true}) =>
      showDialog(
          context: this,
          builder: (context) => dialog,
          barrierDismissible: barrierDismissible);

  Future showAppBottomSheet(Widget dialog,
          {bool barrierDismissible = true, bool isScrollControlled = false}) =>
      showModalBottomSheet(
        context: this,
        isScrollControlled: isScrollControlled,
        isDismissible: barrierDismissible,
        backgroundColor: AppColor.white,
        useSafeArea: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        clipBehavior: Clip.hardEdge,
        builder: (context) => dialog,
        // barrierDismissible: barrierDismissible,
      );

  void pop([dynamic result]) {
    if (Navigator.of(this).canPop()) Navigator.of(this).pop(result);
  }
}
