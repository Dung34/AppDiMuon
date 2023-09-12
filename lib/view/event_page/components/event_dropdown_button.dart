import 'package:flutter/material.dart';

class EventDropdownButton extends StatefulWidget {
  final TextStyle? buttonStyle;
  final Color? dropdownColor;
  final Widget? hint;
  final Icon? icon;
  final TextStyle? itemStyle;
  final Function(String?) onChanged;
  final EdgeInsetsGeometry? padding;
  final List<String> tabs;
  final Widget? underline;
  final String? value;

  const EventDropdownButton({
    super.key,
    this.buttonStyle,
    this.dropdownColor,
    this.hint,
    this.icon,
    this.itemStyle,
    required this.onChanged,
    this.padding,
    required this.tabs,
    this.underline,
    this.value,
  });

  @override
  State<EventDropdownButton> createState() => _EventDropdownButtonState();
}

class _EventDropdownButtonState extends State<EventDropdownButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      dropdownColor: widget.dropdownColor,
      hint: widget.hint,
      items: widget.tabs
          .map((e) => DropdownMenuItem(
                value: e,
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(e),
                ),
              ))
          .toList(),
      icon: widget.icon ??
          const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: Color(0xFF10316B),
          ),
      onChanged: widget.onChanged,
      padding: widget.padding,
      selectedItemBuilder: (BuildContext context) => widget.tabs
          .map((e) => Center(
                child: Text(
                  e,
                  style: widget.buttonStyle,
                ),
              ))
          .toList(),
      style: widget.itemStyle,
      underline: widget.underline,
      value: widget.value,
    );
  }
}
