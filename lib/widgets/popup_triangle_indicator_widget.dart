import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pingduoduo/widgets/triangle_painter.dart';

class PopupTriangleIndicator {

  bool _isShowing =false;

  Key anchorKey;
  List _data = ['综合排序','评分排序'];
  OverlayEntry layout;

  double top;
  double left;
  double width;

  ValueChanged<String> valueChanged;

  PopupTriangleIndicator() {
    _buildLayout();
  }


  List get data => _data;


  bool get isShowing => _isShowing;

  void _buildLayout() {
    layout = OverlayEntry(
      builder: (context) {
        return Positioned(
            width: ScreenUtil.getInstance().setWidth(320),
            height: ScreenUtil.getInstance().setHeight(250),
            top: top,
            child:Scaffold(
              body: Container(
                child: Stack(
                  alignment: AlignmentDirectional.topStart,
                  children: <Widget>[

                    Positioned(
                      child: Container(
                        margin: EdgeInsets.only(left: 10,top: 10),
                        decoration: BoxDecoration(

                            color:Colors.white,
                            shape: BoxShape.rectangle,
                            boxShadow: [
                              BoxShadow(color: Colors.grey[300],offset: Offset(0, -2),
                                ///模糊阴影半径
                                blurRadius: 5,
                              ),
                              BoxShadow(color: Colors.grey[300], offset: Offset(-1, -1), blurRadius: 5),
                              BoxShadow(color: Colors.grey[300], offset: Offset(1, -1), blurRadius: 5),
                              BoxShadow(color: Colors.grey[300], offset: Offset(-1, 1), blurRadius: 5)
                            ]
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[

                            Expanded(child: GestureDetector(
                              onTap: (){
                                valueChanged(data[0]);
                              },
                                child: Center(child: Text(data[0])))),
                            Divider(height: 1,thickness: 1,endIndent: 4),
                            Expanded(child: GestureDetector(
                                onTap: (){valueChanged(data[1]);},
                                child: Center(child: Text(data[1]))))
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: left,
                      child: CustomPaint(
                        size: Size(15.0, 10),
                        painter: TrianglePainter(isDown: false, color: Colors.white),
                      ),
                    ),

                  ],
                ),



              ),
            )

        );
      },
    );
  }

  void show(GlobalKey key,ValueChanged callback) {
    this.valueChanged = callback;
    Rect rect = getWidgetGlobalRect(key);

    top = rect.bottom;
    left = rect.left+rect.width/2;
     _isShowing =true;
    Overlay.of(key.currentContext).insert(layout);
  }

  void dismiss() {
    if (layout != null && _isShowing) {
       _isShowing =false;
      layout.remove();
    }
  }

  Rect getWidgetGlobalRect(GlobalKey key) {
    RenderBox renderBox = key.currentContext.findRenderObject();
    var offset = renderBox.localToGlobal(Offset.zero);
    return Rect.fromLTWH(
        offset.dx, offset.dy, renderBox.size.width, renderBox.size.height);
  }
}
