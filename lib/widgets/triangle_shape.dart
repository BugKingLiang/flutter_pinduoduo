import 'package:flutter/material.dart';

class TriangleShape extends ShapeBorder{
  @override
  EdgeInsetsGeometry get dimensions => null;

  Color triangleRectColor;
  Color triangleColor;


  TriangleShape({@required this.triangleRectColor, @required this.triangleColor});

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    return null;
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    return null;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {
    double shapeWidth = 10;


    var backgourdPath = Paint()
      ..color = triangleRectColor
      ..style = PaintingStyle.fill;
    canvas.drawRect(Rect.fromLTRB(0, 0, shapeWidth, rect.height), backgourdPath);

    var paint = Paint()
        ..color = triangleColor
        ..style = PaintingStyle.fill;

    var path = Path()
    ..moveTo(shapeWidth, (rect.height - shapeWidth*2)/2)
    ..lineTo(0, rect.height/2)
    ..lineTo(shapeWidth, rect.height/2+shapeWidth)
    ..close();

    canvas.drawPath(path, paint);

  }

  @override
  ShapeBorder scale(double t) {
    return null;
  }




}