import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pingduoduo/util/image_utls.dart';

class SearchWidget extends StatelessWidget {

  double _imageSize;
  Color bgColor;


  SearchWidget({this.bgColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    _imageSize = ScreenUtil.getInstance().setWidth(60);
    return Container(
      color: bgColor,
      padding: EdgeInsets.all(10),
      child: Container(
        height: ScreenUtil.getInstance().setHeight(100),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3), color: Color(0xffededed)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(ImageUtils.getImagePath('main/apj'),
                    fit: BoxFit.fill, width: _imageSize, height: _imageSize),
                Container(
                    margin: EdgeInsets.only(left: 5), child: Text('百亿补贴')),
              ],
            )),
            Container(
                margin: EdgeInsets.only(right: 10),
                child: Image.asset(
                  ImageUtils.getImagePath('icons/anb'),
                  fit: BoxFit.fill,
                  width: _imageSize,
                  height: _imageSize,
                ))
          ],
        ),
      ),
    );
  }
}
