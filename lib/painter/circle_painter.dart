import 'package:flutter/widgets.dart';

class CirclePainter extends CustomPainter {
  Color colors;

  CirclePainter({required this.colors});

  //定义画笔
  late final Paint _paint = Paint()
    ..color = colors
    ..strokeCap = StrokeCap.square
    ..isAntiAlias = true
    ..strokeWidth = 3.0
    ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 30.0, _paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
