import 'dart:math';
import 'package:flutter/material.dart';

class TimerPainter extends CustomPainter {
  final double progress;
  final Color backgroundColor, color;

  TimerPainter({
    required this.progress,
    required this.backgroundColor,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = size.width / 2;

    // 배경 원 그리기
    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 10.0
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(center, radius, backgroundPaint);

    // 프로그레스 원 그리기
    final progressPaint = Paint()
      ..color = color
      ..strokeWidth = 10.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final progressAngle = 2 * pi * progress;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,  // 시작 각도 (12시 방향)
      progressAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(TimerPainter old) {
    return progress != old.progress;
  }
}
