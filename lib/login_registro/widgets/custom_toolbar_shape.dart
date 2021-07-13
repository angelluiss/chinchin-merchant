import 'package:chinchin_merchant/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomToolbarShape extends CustomPainter {
  const CustomToolbarShape();

  @override
  void paint(Canvas canvas, Size size) {
    final paintCircle = Paint()
      ..color = primaryLightColor
      ..strokeWidth = 5
      ..style = PaintingStyle.fill;

    Offset left = Offset(10, size.height / 2);

    canvas.drawCircle(left, size.height / 2, paintCircle);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
