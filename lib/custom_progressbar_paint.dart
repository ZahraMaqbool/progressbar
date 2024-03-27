import 'package:flutter/material.dart';

class CustomProgressBar extends CustomPainter {
  final double progress;
  CustomProgressBar({required this.progress});
  @override
  void paint(Canvas canvas, Size size) {
    final Size(:width, :height) = size;
    final progressPaint = Paint()
      ..color = Colors.blue
      ..strokeCap=StrokeCap.round
      ..strokeWidth = size.height;
    canvas.drawLine(Offset(0, size.height / 2),
        Offset(size.width * progress, size.height / 2), progressPaint);
  }

  @override
  bool shouldRepaint(CustomProgressBar oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
