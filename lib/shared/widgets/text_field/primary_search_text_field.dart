import 'dart:async';

import 'package:flutter/material.dart';

import '../../../config/config.dart';
import '../../../data/resources/resources.dart';

class PrimarySearchTextField extends StatefulWidget {
  const PrimarySearchTextField({
    Key? key,
    required this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.debounce = 1000,
    required this.controller,
    required this.onChanged,
    this.hintText = 'Tìm kiếm',
  }) : super(key: key);

  final String label;
  final String? hintText;
  final dynamic prefixIcon;
  final String? suffixIcon;
  final TextEditingController controller;
  final Function(String?) onChanged;
  final int debounce;

  @override
  State<PrimarySearchTextField> createState() => _PrimarySearchTextFieldState();
}

class _PrimarySearchTextFieldState extends State<PrimarySearchTextField> {
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: _onSearchChanged,
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle:
            AppTextTheme.robotoRegular14.copyWith(color: AppColor.gray04),
        filled: true,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        fillColor: AppColor.fourth200,
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.transparent, width: 0),
            borderRadius:
                BorderRadius.all(Radius.circular(AppConfig.defaultRadius))),
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.transparent, width: 1),
            borderRadius:
                BorderRadius.all(Radius.circular(AppConfig.defaultRadius))),
        suffixIcon: widget.suffixIcon != null
            ? IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: AppColor.gray04,
                ),
              )
            : null,
      ),
    );
  }

  void _onSearchChanged(String value) {
    if (_debounce?.isActive ?? false) {
      _debounce?.cancel();
    }
    _debounce = Timer(
        Duration(milliseconds: widget.debounce), () => widget.onChanged(value));
  }
}
