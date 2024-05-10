import 'package:flutter/material.dart';

class PolygonController extends ChangeNotifier {
  int _corners;
  double _startAngle;
  double _strokeWidth;
  Color _color;
  double? _radius;
  PaintingStyle _paintingStyle;
  StrokeJoin _strokeJoin;

  PolygonController({
    int corners = 3,
    double startAngle = 0,
    double strokeWidth = 1,
    Color color = Colors.black,
    double? radius,
    PaintingStyle paintingStyle = PaintingStyle.stroke,
    StrokeJoin strokeJoin = StrokeJoin.round,
  })  : _corners = corners,
        _startAngle = startAngle,
        _strokeWidth = strokeWidth,
        _color = color,
        _radius = radius,
        _paintingStyle = paintingStyle,
        _strokeJoin = strokeJoin;

  int get corners => _corners;
  double get startAngle => _startAngle;
  double get strokeWidth => _strokeWidth;
  Color get color => _color;
  double? get radius => _radius;
  PaintingStyle get paintingStyle => _paintingStyle;
  StrokeJoin get strokeJoin => _strokeJoin;

  set corners(int value) {
    _corners = value;
    notifyListeners();
  }

  set startAngle(double value) {
    _startAngle = value;
    notifyListeners();
  }

  set strokeWidth(double value) {
    _strokeWidth = value;
    notifyListeners();
  }

  set color(Color value) {
    _color = value;
    notifyListeners();
  }

  set radius(double? value) {
    _radius = value;
    notifyListeners();
  }

  set paintingStyle(PaintingStyle value) {
    _paintingStyle = value;
    notifyListeners();
  }

  set strokeJoin(StrokeJoin value) {
    _strokeJoin = value;
    notifyListeners();
  }
}
