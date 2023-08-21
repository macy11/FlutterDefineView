import 'dart:math';

import 'package:flutter/widgets.dart';

class TabBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var width = sqrt(30 * 30 - 16 * 16);
    var path = Path();
    path.moveTo(0, size.height);
    path.lineTo(0, 14);
    path.lineTo(size.width / 2 - width, 14);
    var endPoint = Offset(size.width / 2 + width, 14);
    path.arcToPoint(
      endPoint,
      radius: const Radius.circular(30),
    );
    path.lineTo(size.width, 14);
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
