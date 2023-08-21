import 'dart:math';

import 'package:flutter/material.dart';

class ShadowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var width = sqrt(30 * 30 - 16 * 16);
    var endPoint = Offset(size.width / 2 + width, 14);
    late final path = Path()
      ..moveTo(0, size.height)
      ..lineTo(0, 14)
      ..lineTo(size.width / 2 - width, 14)
      ..arcToPoint(endPoint, radius: const Radius.circular(30.0))
      ..lineTo(size.width, 14)
      ..lineTo(size.width, size.height);
    canvas.drawShadow(path, Colors.black.withOpacity(0.1), 1.0, true);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
