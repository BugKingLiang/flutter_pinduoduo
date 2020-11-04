import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pingduoduo/widgets/filter_widget.dart';
import 'package:pingduoduo/widgets/triangle_painter.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}
/**
 *
 *
 * decoration: BoxDecoration(
    color: Colors.white,
    shape: BoxShape.rectangle,
    boxShadow: [
    BoxShadow(color: Colors.grey[300],offset: Offset(1, -1),
    ///模糊阴影半径
    blurRadius: 5,
    ),
    //              BoxShadow(color: Colors.grey[300], offset: Offset(-1, -1), blurRadius: 5),
    //              BoxShadow(color: Colors.grey[300], offset: Offset(1, -1), blurRadius: 5),
    //              BoxShadow(color: Colors.grey[300], offset: Offset(-1, 1), blurRadius: 5)
    ]
    ),

    ),
 *
 */
class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Scaffold(
        appBar: PreferredSize(
      child: AppBar(
          elevation: 0,
          brightness: Brightness.light,
          backgroundColor: Colors.white),
      preferredSize: Size.fromHeight(0),
    ),
    body: Container(
      child: Center(

        child: Container(
          width: 300,height: 300,
          child: Stack(
            children: <Widget>[

              Positioned(
                top: 10,
                  child: Container(width: 300,height: 290,
                decoration: BoxDecoration(
                    color:Colors.white,
                    shape: BoxShape.rectangle,
                    boxShadow: [
                      BoxShadow(color: Colors.grey[300],offset: Offset(0, 5),
                        ///模糊阴影半径
                        blurRadius: 5,
                      ),
                      BoxShadow(color: Colors.grey[300], offset: Offset(-1, -1), blurRadius: 5),
                      BoxShadow(color: Colors.grey[300], offset: Offset(1, -1), blurRadius: 5),
                      BoxShadow(color: Colors.grey[300], offset: Offset(-1, 1), blurRadius: 5)
                    ]
                ),
                    child: Center(
                      child: Text('kdkdkdk'),
                    ),

              ),),
              CustomPaint(
                size: Size(15.0, 10),
                painter: TrianglePainter(isDown: false, color: Colors.white),
              ),


            ],

          ),
        ),
      ),
    ));
  }
}


/*

Container(

              child: Stack(
                children: <Widget>[

                  Positioned(
                    top: 10,
                    child: Container(

                      width: ScreenUtil().setWidth(320),
                      height: ScreenUtil().setHeight(250),
                      decoration: BoxDecoration(

                          color:Colors.white,
                          shape: BoxShape.rectangle,
                          boxShadow: [
                            BoxShadow(color: Colors.grey[300],offset: Offset(0, -3),
                              ///模糊阴影半径
                              blurRadius: 5,
                            ),
                            BoxShadow(color: Colors.grey[300], offset: Offset(-1, -1), blurRadius: 5),
                            BoxShadow(color: Colors.grey[300], offset: Offset(1, -1), blurRadius: 5),
                            BoxShadow(color: Colors.grey[300], offset: Offset(-1, 1), blurRadius: 5)
                          ]
                      ),

                    ),),
                  CustomPaint(
                    size: Size(15.0, 10),
                    painter: TrianglePainter(isDown: false, color: Colors.red),
                  ),


                ],

              ),
            )



 */
