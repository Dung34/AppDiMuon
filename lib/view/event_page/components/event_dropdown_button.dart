import 'package:flutter/material.dart';

class EventDropdownButton extends StatefulWidget {
  final TextStyle? buttonStyle;
  final Color? dropdownColor;
  final Icon? icon;
  final TextStyle? itemStyle;
  final Function(String?) onChanged;
  final EdgeInsetsGeometry? padding;
  final String? value;
  final List<String> tabs;

  const EventDropdownButton(
      {super.key,
      this.buttonStyle,
      this.dropdownColor,
      this.icon,
      this.itemStyle,
      required this.onChanged,
      this.padding,
      this.value,
      required this.tabs});

  @override
  State<EventDropdownButton> createState() => _EventDropdownButtonState();
}

class _EventDropdownButtonState extends State<EventDropdownButton> {
  String? selectedTab;

  @override
  void initState() {
    super.initState();
    selectedTab = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      dropdownColor: widget.dropdownColor,
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
      value: widget.value,
      onChanged: widget.onChanged,
    );
  }
}
