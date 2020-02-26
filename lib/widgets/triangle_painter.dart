import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// 画弹出菜单下面的三角形
class TrianglePainter extends CustomPainter {
  bool isDown;
  Color color;

  TrianglePainter({this.isDown = true, this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Paint _paint = new Paint();
    _paint.strokeWidth = 2.0;
    _paint.color = color;
    _paint.style = PaintingStyle.fill;

    Path path = new Path();
    Path shadowPath = new Path();
    shadowPath.moveTo(0, 0);
    shadowPath.lineTo(size.width, size.height);

    if (isDown) {
      path.moveTo(0.0, -1.0);
      path.lineTo(size.width, -1.0);
      path.lineTo(size.width / 2.0, size.height);
    } else {
      path.moveTo(size.width / 2.0, 0.0);
      path.lineTo(0.0, size.height + 1);
      path.lineTo(size.width, size.height + 1);

      shadowPath.moveTo(size.width / 2.0, 0.0);
      shadowPath.lineTo(0.0, size.height + 1);
    }
//    canvas.drawShadow(shadowPath, Colors.grey[300], 5, true);
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
