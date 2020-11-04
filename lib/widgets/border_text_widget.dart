

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class BorderTextWidget extends StatelessWidget {

  String _text;


  BorderTextWidget(this._text);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(100),
      height: ScreenUtil().setHeight(60),
      alignment: Alignment.center,
      decoration: BoxDecoration(

        borderRadius: BorderRadius.all(Radius.circular(3)),
        border: Border.all(color: Colors.red)

      ),
      child: Text(_text,style: TextStyle(fontSize: 10,color: Colors.red)),

    );
  }
}
