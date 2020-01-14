import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pingduoduo/widgets/divider_dart.dart';

class SubsidyWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: ScreenUtil().setHeight(450),
      child: Column(
        children: <Widget>[
          Expanded(
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(width: ScreenUtil().setWidth(20)),
                    Image.network(
                      'https://pinduoduoimg.yangkeduo.com/brand_creation/allowance_icon.png@1300w_1l_70Q_50sh.webp',
                      width: ScreenUtil().setWidth(60),
                      height: ScreenUtil().setWidth(60),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text('百亿补贴',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600)),
                    ),
//                    SizedBox(width: ScreenUtil().setWidth(20)),
//
//                    SizedBox(width: ScreenUtil().setWidth(20)),
                    Padding(padding: EdgeInsets.only(left: ScreenUtil().setWidth(20),right: ScreenUtil().setWidth(20))
                    ,child: Text('|', style: TextStyle(color: Color(0xff9c9c9c)))),
                    Text('正品保障', style: TextStyle(color: Color(0xff9c9c9c))),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Text('全部补贴 >',
                                style: TextStyle(color: Color(0xff9c9c9c)))),
                      ),
                      flex: 1,
                    )
                  ]),
              flex: 1),
          Expanded(
            flex: 4,
            child: Row(
              children: <Widget>[
                Expanded(
                    child: _createGoodsWidget(
                        'https://t00img.yangkeduo.com/goods/images/2019-12-12/ffcf624e75937f14bc0340449b9b8f98.jpeg?imageMogr2/sharpen/1%7CimageView2/2/w/1300/q/70/format/webp',
                        '苹果',
                        '5199')),
                Expanded(
                    child: _createGoodsWidget(
                        'https://t00img.yangkeduo.com/goods/images/2019-12-05/c46f6fe83c6d7ca06c8d0bfeb05371e9.jpeg?imageMogr2/sharpen/1%7CimageView2/2/w/1300/q/70/format/webp',
                        '苏洪鲜食',
                        '61.9')),
                Expanded(
                    child: _createGoodsWidget(
                        'https://t00img.yangkeduo.com/goods/images/2019-12-09/56f5bd2a60b39d5b1ed30536badf16dd.jpeg?imageMogr2/sharpen/1%7CimageView2/2/w/1300/q/70/format/webp',
                        '小米',
                        '166')),
                Expanded(
                    child: _createGoodsWidget(
                        'https://t00img.yangkeduo.com/goods/images/2019-09-04/13f2821b0bfebe234baaa74ea5ae0d41.jpeg?imageMogr2/sharpen/1%7CimageView2/2/w/1300/q/70/format/webp',
                        '吉列',
                        '8')),
              ],
            ),
          ),
          DividerWidget(height: 5)
        ],
      ),
    );
  }

  Widget _createGoodsWidget(String image, String goodsName, String price) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Stack(
          alignment: Alignment.bottomLeft,
          children: <Widget>[
            Image.network(image),
            Positioned(
              child: Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                color: Color(0xffd6a189),
                child: Text(
                  goodsName,
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
              left: 10,
            )
          ],
        ),
        Text('补贴价格¥${price}',
            style: TextStyle(fontSize: 12, color: Color(0xffe02e24))),
      ],
    );
  }
}
