import 'package:currency_converter/src/shared/system_design/system_design.dart';
import 'package:flutter/material.dart';

class CurvedBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lightPaint = Paint()
      ..color = AppColors.tertiary
      ..style = PaintingStyle.fill;

    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      lightPaint,
    );

    final orangePaint = Paint()
      ..color = AppColors.primary
      ..style = PaintingStyle.fill;

    final path = Path();

    final scaleX = size.width / 450;
    final scaleY = size.height / 450;

    path
      ..moveTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(499 * scaleX, 413 * scaleY)
      ..cubicTo(
        100 * scaleX,
        288 * scaleY,
        284 * scaleX,
        50 * scaleY,
        349 * scaleX,
        0,
      )
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(path, orangePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
