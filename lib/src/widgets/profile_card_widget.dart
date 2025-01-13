import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key, this.child});
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _MyPainter(),
      child: child,
    );
  }
}

class _MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Color firstColor = Colors.red[900]!;
    Color secondColor = Colors.black;
    final lapiz = Paint()
      ..shader = ui.Gradient.linear(
        const Offset(0, 0),
        Offset(size.width, size.height),
        [
          firstColor,
          secondColor,
        ],
      );

    canvas.drawRect(Rect.largest, lapiz);
    canvas.drawPath(Path(), lapiz);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
