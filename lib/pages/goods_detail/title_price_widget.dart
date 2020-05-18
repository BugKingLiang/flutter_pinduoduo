import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pingduoduo/widgets/triangle_shape.dart';

class TitlePriceWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _cratePriceWidget(),
        Padding(
          padding: const EdgeInsets.only(left: 8,top: 8),
          child: Text('支持分期，低至454元/期',style: TextStyle(color: Color(0xffe02e24),fontSize: 16))
        ),
        _describeWidget()
      ],
    );
  }



  Widget _cratePriceWidget() {
    return Container(
      height: ScreenUtil.getInstance().setHeight(200),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Container(
                color: Color(0xfff44250),
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text.rich(TextSpan(children: [
                      TextSpan(
                          text: '补贴价格 ¥',
                          style: TextStyle(color: Colors.white)),
                      TextSpan(
                          text: '5068',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w700)),
                      WidgetSpan(
                          child: Container(
                              width: ScreenUtil.getInstance().setWidth(260),
                              padding: EdgeInsets.all(6),
                              margin: EdgeInsets.only(left: 3),
                              decoration: BoxDecoration(
                                  color: Color(0xffffd6b3),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                  child: Text('官方补贴品',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xfff44250))))))
                    ])),
                    Container(
                        margin: EdgeInsets.only(top: 3),
                        child: Text('全网最低价   5238 | 已拼160件',
                            style: TextStyle(color: Colors.white)))
                  ],
                ),
              ),
              flex: 2),
          Expanded(
              child: Material(
                shape: TriangleShape(
                    triangleRectColor: Color(0xfff44250),
                    triangleColor: Color(0xffe8313f)),
                child: Container(
                  color: Color(0xffe8313f),
                  child: Center(child: Text('百亿补贴',
                      style: TextStyle(color: Colors.white, fontSize: 20))),
                ),
              ),
              flex: 1)
        ],
      ),
    );
  }

  Widget _describeWidget(){

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text.rich(TextSpan(
        children: [

          WidgetSpan(child: CachedNetworkImage(
              imageUrl: 'https://t00img.yangkeduo.com/goods/images/2018-12-29/e01ec845d67c3717fd0581da8dbf86bd.png?imageMogr2/strip%7CimageView2/2/w/1300/q/80',
          width: ScreenUtil.getInstance().setWidth(140),height: ScreenUtil.getInstance().setHeight(60))),
          TextSpan(text: '小米10 Pro 双模5G 骁龙865  50W快充 拍照智能新品游戏手机【成团后4天内发' ,style: TextStyle(color: Color(0xff151516),fontSize: 18,fontWeight: FontWeight.w700)),

          WidgetSpan(child: Container(
            padding: EdgeInsets.all(2),
            margin: EdgeInsets.only(left: 8),
            decoration: BoxDecoration(
              color: Color(0xffe02e24),
              borderRadius: BorderRadius.circular(3)
            ),

            child: Text('预售',style: TextStyle(color: Colors.white,fontSize: 16),),
          ),),
          WidgetSpan(child: Container(
            padding: EdgeInsets.all(2),
            margin: EdgeInsets.only(left: 8),
            decoration: BoxDecoration(
                color: Color(0xff25b513),
                borderRadius: BorderRadius.circular(3)
            ),

            child: Text('顺丰包邮',style: TextStyle(color: Colors.white,fontSize: 16),),
          ),)

        ]
      )),
    );


  }


}
