import 'package:flutter/material.dart';

class PolygonController extends ChangeNotifier {
  int _corners;
  double _startAngle;
  double _strokeWidth;
  Color _color;
  double? _radius;

  PolygonController({
    int corners = 3,
    double startAngle = 0,
    double strokeWidth = 1,
    Color color = Colors.black,
    double? radius,
  })  : _corners = corners,
        _startAngle = startAngle,
        _strokeWidth = strokeWidth,
        _color = color,
        _radius = radius;

  int get corners => _corners;
  double get startAngle => _startAngle;
  double get strokeWidth => _strokeWidth;
  Color get color => _color;
  double? get radius => _radius;

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
}
