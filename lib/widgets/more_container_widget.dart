import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pingduoduo/util/image_utls.dart';


class MoreContainerWidget extends StatelessWidget {
  Widget child;
  double paddingLeft;
  double paddingRight;
  double _moreImageSize = ScreenUtil.getInstance().setWidth(50);
  String rightString;


  MoreContainerWidget({@required this.child,this.rightString,this.paddingLeft = 0,this.paddingRight = 5});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: paddingLeft,right: paddingRight),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: child,
          ),
          Offstage(
            offstage: rightString == null,
            child: Text(rightString??''),
          ),
          Image.asset(ImageUtils.getImagePath('icons/more_grey'),width: _moreImageSize,height: _moreImageSize,)

        ],
      ),
    );
  }
}
