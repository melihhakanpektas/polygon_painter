import 'dart:math';

import 'package:flutter/material.dart';

class PolygonPainterStateless extends CustomPainter {
  final int corners;
  final double startAngle;
  final double strokeWidth;
  final Color color;
  final double? radius;
  final PaintingStyle paintingStyle;
  final StrokeJoin strokeJoin;

  PolygonPainterStateless({
    this.corners = 3,
    this.startAngle = 0,
    this.strokeWidth = 1,
    this.color = Colors.black,
    this.radius,
    this.paintingStyle = PaintingStyle.stroke,
    this.strokeJoin = StrokeJoin.round,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final hypotenuseOfStrokeWidth = cos(pi / corners) * (strokeWidth * 2);
    final r = (radius ??
            min(
                  size.width,
                  size.height,
                ) /
                2) -
        hypotenuseOfStrokeWidth;
    final centerOffset = Offset(size.width / 2, size.height / 2);
    Offset startPoint = Offset(r * cos(startAngle), r * sin(startAngle));
    final angle = (2 * pi) / corners;

    final path = Path();
    path.moveTo(startPoint.dx + centerOffset.dx, startPoint.dy + centerOffset.dy);

    for (int i = 1; i <= corners; i++) {
      double x = r * cos(startAngle + angle * i) + centerOffset.dx;
      double y = r * sin(startAngle + angle * i) + centerOffset.dy;
      path.lineTo(x, y);
    }

    path.close();

    final paint = Paint()
      ..color = color
      ..style = paintingStyle
      ..strokeJoin = strokeJoin
      ..strokeWidth = strokeWidth;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
