import 'package:chinchin_merchant/utils/constants.dart';
import 'package:flutter/material.dart';

class CircularPainterLeft extends StatelessWidget {
  const CircularPainterLeft({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        painter: _HeaderPaintDiagonal(),
      ),
    );
  }
}

class _HeaderPaintDiagonal extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill
      ..strokeWidth = 10;

    final path = Path();
    path.lineTo(0, size.height * 0.40);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    canvas.drawPath(path, paint);

    final paintCircle = Paint()
      ..color = primaryLightColor
      ..strokeWidth = 5
      ..style = PaintingStyle.fill;

    Offset center = Offset(size.width / 2, size.height * 0.35);

    canvas.drawCircle(center, 80, paintCircle);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
