import 'package:flutter/material.dart';

import '../../../data/resources/colors.dart';
import '../../../data/resources/themes.dart';
import '../button/back_button.dart';

// ignore: must_be_immutable
class PrimaryAppBar extends StatefulWidget implements PreferredSizeWidget {
  final dynamic title;
  final List<Widget>? actions;
  final Widget? leading;
  final double? leadingWidth;
  final bool centerTitle;
  final bool canPop;
  final VoidCallback? onBackPressed;
  final Color? backgroundColor;
  final double? elevation;
  final double? toolbarHeight;
  final Function(String)? onChangeText;
  _PrimaryAppBarState? _primaryAppBarState;

  PrimaryAppBar(
      {super.key,
      this.title,
      this.actions,
      this.leading,
      this.leadingWidth,
      this.canPop = true,
      this.onBackPressed,
      this.onChangeText,
      this.centerTitle = false,
      this.backgroundColor,
      this.elevation,
      this.toolbarHeight}) {
    _primaryAppBarState = _PrimaryAppBarState(title: title);
  }

  @override
  // ignore: no_logic_in_create_state
  State<PrimaryAppBar> createState() => _primaryAppBarState!;

  void changeText(String text) {
    _primaryAppBarState?.onChangeText(text);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _PrimaryAppBarState extends State<PrimaryAppBar> {
  dynamic title;

  _PrimaryAppBarState({this.title});

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      backgroundColor:
          widget.backgroundColor ?? AppColor.primaryBackgroundColor,
      title: title is String
          ? Text(title ?? '',
              style:
                  AppTextTheme.lexendBold18.copyWith(color: AppColor.darkGray))
          : title is Widget
              ? title
              : Container(),
      elevation: widget.elevation ?? 0,
      leading: widget.leading ??
          (widget.canPop
              ? BackButtonCustom(
                  onPressed: widget.onBackPressed,
                )
              : null),
      leadingWidth: widget.leadingWidth,
      actions: widget.actions,
      centerTitle: widget.centerTitle,
      toolbarHeight: widget.toolbarHeight,
    );
  }

  void onChangeText(String text) {
    if (mounted) {
      setState(() {
        title = text;
      });
    }
  }
}
