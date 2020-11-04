import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pingduoduo/util/color_constant.dart';
import 'package:pingduoduo/util/image_utls.dart';

//快速返回部件
class QuickBackWidget extends StatelessWidget {
  
  ScrollController _controller;

  QuickBackWidget(this._controller);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      mini: true,
      backgroundColor: Colors.white,
      onPressed: () {
        _controller.animateTo(.0,
            duration: Duration(milliseconds: 200),
            curve: Curves.ease
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(ImageUtils.getImagePath('icons/aj9'),
              width: ScreenUtil().setWidth(40),
              height: ScreenUtil().setWidth(40)),
          Container(
              child: Text('顶部',
                  style:
                      TextStyle(fontSize: 10, color: ColorConstant.text_gray)))
        ],
      ),
    );
  }
}
