import 'dart:math';

import 'package:flutter/material.dart';
import 'package:polygon_painter/polygon_painter.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final controller = PolygonController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'polygon_painter Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: const Text('polygon_painter Example'),
            backgroundColor: Colors.blue,
          ),
          body: ListenableBuilder(
              listenable: controller,
              builder: (context, child) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Center(
                        child: SizedBox(
                          height: 300,
                          width: 300,
                          child: CustomPaint(
                            painter: PolygonPainter(
                              controller: controller,
                            ),
                          ),
                        ),
                      ),
                      Slider(
                        min: 0,
                        max: pi * 2,
                        value: controller.startAngle,
                        onChanged: (value) {
                          controller.startAngle = value;
                        },
                      ),
                      Slider(
                        min: 1,
                        max: 50,
                        value: controller.strokeWidth,
                        onChanged: (value) {
                          controller.strokeWidth = value;
                        },
                      ),
                      Slider(
                        min: 2,
                        max: 50,
                        value: controller.corners.toDouble(),
                        onChanged: (value) {
                          controller.corners = value.toInt();
                        },
                      ),
                      ElevatedButton(
                        onPressed: () {
                          controller.color =
                              Colors.primaries[Random().nextInt(Colors.primaries.length)];
                        },
                        child: const Text('Change Color'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          controller.paintingStyle =
                              controller.paintingStyle == PaintingStyle.stroke
                                  ? PaintingStyle.fill
                                  : PaintingStyle.stroke;
                        },
                        child: const Text('Change Painting Style'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          controller.strokeJoin =
                              StrokeJoin.values[Random().nextInt(StrokeJoin.values.length)];
                        },
                        child: const Text('Change Stroke Join'),
                      ),
                    ],
                  ),
                );
              })),
    );
  }
}
