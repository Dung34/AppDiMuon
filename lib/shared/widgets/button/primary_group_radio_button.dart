import 'package:flutter/material.dart';

import '../../../data/resources/resources.dart';

class PrimaryGroupRadioButton extends StatefulWidget {
  final Color? activeColor;
  final List<int>? flex;
  final List<String> items;
  final String? initialValue;
  final Function(String) onChanged;
  final TextStyle? style;

  const PrimaryGroupRadioButton({
    Key? key,
    this.activeColor,
    this.flex,
    required this.items,
    this.initialValue,
    required this.onChanged,
    this.style,
  }) : super(key: key);

  @override
  State<PrimaryGroupRadioButton> createState() =>
      _PrimaryGroupRadioButtonState();
}

class _PrimaryGroupRadioButtonState extends State<PrimaryGroupRadioButton> {
  String? groupValue;

  @override
  void initState() {
    groupValue = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: widget.items
          .asMap()
          .entries
          .map(
            (e) => Expanded(
              flex: widget.flex == null ? 1 : widget.flex![e.key],
              child: RadioListTile(
                dense: true,
                contentPadding: EdgeInsets.zero,
                value: widget.items[e.key],
                groupValue: groupValue,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: const VisualDensity(
                    horizontal: VisualDensity.minimumDensity,
                    vertical: VisualDensity.minimumDensity),
                title: Text(
                  widget.items[e.key],
                  style: widget.style,
                ),
                activeColor: widget.activeColor,
                onChanged: (value) {
                  setState(() {
                    groupValue = value;
                    widget.onChanged.call(value!);
                  });
                },
              ),
            ),
          )
          .toList(),
    );
  }
}
