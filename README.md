# Polygon Painter

![Pub Version](https://img.shields.io/pub/v/polygon_painter)
[![GitHub issues](https://img.shields.io/github/issues/MelihHakanPektas/polygon_painter.svg)](https://github.com/MelihHakanPektas/flutter_midi_pro/issues)
![GitHub stars](https://img.shields.io/github/stars/melihhakanpektas/polygon_painter?style=social)

This package provides a `PolygonPainterStateless` class that allows you to draw polygons with a customizable number of corners, start angle, stroke width, color, radius, painting style, and stroke join.

<img src="https://raw.githubusercontent.com/melihhakanpektas/polygon_painter/master/assets/polygon_painter.gif" width="300">

## Getting Started

To use this package, add `polygon_painter` as a dependency in your `pubspec.yaml` file.

## Usage

Here is a basic example of how to use the `PolygonPainterStateless` class:

```dart
SizedBox(
    height: 300,
    width: 300,
    child: CustomPaint(
        painter: PolygonPainter(
            controller: controller, // PolygonPainterController
        ),
    ),
),
```

## Additional Information

For more information, check out the [documentation](https://pub.dev/documentation/polygon_painter)
