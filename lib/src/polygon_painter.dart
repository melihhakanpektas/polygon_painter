import 'dart:math';

import 'package:flutter/material.dart';
import 'package:polygon_painter/src/polygon_controller.dart';

class PolygonPainter extends CustomPainter {
  final PolygonController controller;

  PolygonPainter({
    required this.controller,
  }) : super(repaint: controller);

  @override
  void paint(Canvas canvas, Size size) {
    final hypotenuseOfStrokeWidth = cos(pi / controller.corners) * (controller.strokeWidth * 2);
    final radius = (controller.radius ??
            min(
                  size.width,
                  size.height,
                ) /
                2) -
        hypotenuseOfStrokeWidth;
    final centerOffset = Offset(size.width / 2, size.height / 2);
    final startAngle = controller.startAngle;
    Offset startPoint = Offset(radius * cos(startAngle), radius * sin(startAngle));
    final angle = (2 * pi) / controller.corners;

    final path = Path();
    path.moveTo(startPoint.dx + centerOffset.dx, startPoint.dy + centerOffset.dy);

    for (int i = 1; i <= controller.corners; i++) {
      double x = radius * cos(startAngle + angle * i) + centerOffset.dx;
      double y = radius * sin(startAngle + angle * i) + centerOffset.dy;
      path.lineTo(x, y);
    }

    path.close();

    final paint = Paint()
      ..color = controller.color
      ..style = PaintingStyle.stroke
      ..strokeWidth = controller.strokeWidth;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
