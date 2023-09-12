import 'package:flutter/material.dart';

class LinePainter extends CustomPainter {
  double strokeWidth;
  Color? color;

  LinePainter({this.color, required this.strokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color ?? Colors.black
      ..strokeWidth = strokeWidth;

    Offset start = Offset(0, size.height);
    Offset end = Offset(size.width, size.height);

    canvas.drawLine(start, end, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
