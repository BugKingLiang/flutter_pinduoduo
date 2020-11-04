import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//商品评价标签
class GoodsEvaluateFlagWidget extends StatelessWidget {
  String image;

  String flag;
  Color backgroudColor;
  Color flagColor;

  GoodsEvaluateFlagWidget({@required this.flag,this.image, this.backgroudColor,this.flagColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    var imageSize = ScreenUtil().setWidth(40);
    return Container(
      height: ScreenUtil().setHeight(100),
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: backgroudColor,
        borderRadius: BorderRadius.circular(5)
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Offstage(
              offstage: image == null,
              child: image == null ? Container() : Padding(
                padding: const EdgeInsets.only(right: 3),
                child: Image.asset(image,width: imageSize,height: imageSize),
              )),
          Text(flag,style: TextStyle(color: flagColor))
        ],
      ),
    );
  }
}
