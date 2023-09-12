import 'package:flutter/material.dart';

import '../../../data/resources/resources.dart';

// ignore: must_be_immutable
class CenterOutlinedTextField extends StatelessWidget {
  final InputBorder? enabledTextFieldBorder;
  final InputBorder? focusedTextFieldBorder;
  final String? label;
  final TextStyle? labelStyle;
  final EdgeInsetsGeometry? paddingLabel;
  final EdgeInsetsGeometry? paddingTextField;
  final bool? readOnly;
  String? text;
  final TextStyle? textFieldStyle;

  CenterOutlinedTextField({
    super.key,
    this.enabledTextFieldBorder,
    this.focusedTextFieldBorder,
    this.label,
    this.labelStyle,
    this.paddingLabel,
    this.paddingTextField,
    this.readOnly,
    this.text,
    this.textFieldStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Padding(
          padding: paddingTextField ?? EdgeInsets.zero,
          child: TextField(
            controller: TextEditingController()..text = text ?? '',
            decoration: InputDecoration(
                enabledBorder: enabledTextFieldBorder,
                focusedBorder: focusedTextFieldBorder),
            readOnly: readOnly ?? false,
            style: textFieldStyle,
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: paddingLabel ?? EdgeInsets.zero,
          child: Opacity(
            opacity: 1.0,
            child: Text(label ?? '',
                style: labelStyle?.copyWith(backgroundColor: AppColor.white)),
          ),
        ),
      ],
    );
  }
}
