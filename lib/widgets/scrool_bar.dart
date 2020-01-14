
import 'package:flutter/material.dart';
class ScroolbarWidget extends CustomPainter{

  Paint _bgPaint;
  Paint _offsetPaint;

  double _offsetRatio;

  ScroolbarWidget(this._offsetRatio){
    _bgPaint = new Paint()
    ..style= PaintingStyle.fill
    ..strokeCap  =StrokeCap.round
    ..color = Colors.grey[350];

    _offsetPaint = new Paint()
    ..style= PaintingStyle.fill
    ..strokeCap  =StrokeCap.round
    ..color = Colors.red;
  }

  @override
  void paint(Canvas canvas, Size size) {
    _bgPaint.strokeWidth = size.height;
    _offsetPaint.strokeWidth = size.height;

    canvas.drawLine(Offset(0, 0), Offset(size.width, 0), _bgPaint);

    //限制大小区间
    if(_offsetRatio<=0 ){
      _offsetRatio = 0;
    }else if(_offsetRatio >= 1){
      _offsetRatio = 1;
    }
    var progress = _offsetRatio*size.width/2;

    canvas.drawLine(Offset(progress, 0), Offset(size.width/2+progress, 0), _offsetPaint);



  }



  @override
  bool shouldRepaint(CustomPainter oldDelegate) {

    return oldDelegate!=this;
  }
}