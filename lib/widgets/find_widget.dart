import 'package:flutter/material.dart';
import 'package:pingduoduo/util/image_utls.dart';

//发现部件
class FindWidget extends StatelessWidget {
  double widht, height;
  double fontSize;

  Color borderColor;

  FindWidget(this.widht, this.height, this.fontSize, {this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widht,
      height: height,
      child: Stack(
        alignment: Alignment.centerRight,
        children: <Widget>[
          CustomPaint(
              painter: CircularBorderWidget(borderColor: borderColor),
              size: Size(widht, height)),
          Container(
            width: widht,
            height: height,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text('发现',
                    style:
                        TextStyle(fontSize: fontSize, color: Color(0xff58595b))),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 2),
                  child: Image.asset(ImageUtils.getImagePath('home/a52'),
                      width: 10, height: 10),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CircularBorderWidget extends CustomPainter {
  Paint _paint;
  Color borderColor;
  Paint _paint2;

  Path _path;

  CircularBorderWidget({this.borderColor = Colors.grey}) {
    _paint = new Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.5
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true
      ..color = borderColor;

    _paint2 = new Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true
      ..color = Colors.green;

    _path = new Path();
  }

  @override
  void paint(Canvas canvas, Size size) {
    double widh = size.width;
    double height = size.height;
    const PI = 3.1415926;
    _path.moveTo(widh, 0);
    _path.lineTo(height / 2, 0);
    _path.addArc(Rect.fromLTRB(0, 0, height, height), 3 * PI / 2, -PI);
    _path.lineTo(widh, height);

    canvas.drawPath(_path, _paint);
//    canvas.drawPath(_path, _paint2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return this == oldDelegate;
  }
}
