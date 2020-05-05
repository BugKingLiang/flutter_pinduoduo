import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pingduoduo/util/utils.dart';
import 'package:pingduoduo/widgets/divider_dart.dart';
import 'package:pingduoduo/widgets/goods_info_title_widget.dart';

class GoodsItemWidget extends StatelessWidget {
  String imageBanner;
  String leadingIcon = 'https://pinduoduoimg.yangkeduo.com/pincard/ba_tag_old.png?imageMogr2/sharpen/50/strip%7CimageView2/2/w/159/q/100/format/webp';
  List tagInfoList;

  String subsityPrice;  //补贴价格
  String originPriceWord; //全网低价
  String salesWording; //已补贴xxx件

  var goodsInfo;


  GoodsItemWidget(this.goodsInfo){
    tagInfoList = goodsInfo['tag_info_list'];
    subsityPrice = Utils.convertPrice(goodsInfo['activity_price']);
    originPriceWord = Utils.convertPrice(goodsInfo['origin_price']);
    salesWording = goodsInfo['sales_wording'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: ScreenUtil.getInstance().setHeight(400),
      child: Row(
        children: <Widget>[

          CachedNetworkImage(imageUrl: goodsInfo['hd_thumb_url'],
              width: ScreenUtil.getInstance().setHeight(400)),
          Expanded(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: GoodsInfoTitleWidget(leadingIcons: [leadingIcon],title: goodsInfo['short_name']),
                ),

                Offstage(
                  offstage: tagInfoList == null || tagInfoList.isEmpty,

                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      border: Border.all(color: Color(0xffffd6a56a))

                    ),
                    child: Padding(
                      //${tagInfoList[0]['text']}
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text('${tagInfoList != null && tagInfoList.isNotEmpty?tagInfoList[0]['text']:''}',style: TextStyle(color: Color(0xffffd6a56a),fontSize: 12)),
                    ),
                  )),

                Expanded(child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    Offstage(
                      offstage: originPriceWord == null,
                      child: Text('全网最低价 ¥${originPriceWord}',style: TextStyle(color: Color(0xff9c9c9c))),
                    ),

                    //价格,销量
                    Row(
                      children: <Widget>[
                        Text.rich(TextSpan(style: TextStyle(color: Color(0xffe02e24)),
                          children:[
                            TextSpan(
                                text: '补贴价格', style: TextStyle(fontSize: 12)),
                            TextSpan(
                                text: ' ¥', style: TextStyle(fontSize: 12,fontWeight: FontWeight.w700)),
                            TextSpan(
                                text: subsityPrice, style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700)),

                          ]
                        )),

                        Text(salesWording,style: TextStyle(color: Color(0xff9c9c9c)))
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: DividerWidget(height: 1,),
                    )



                  ],
                )
                )



              ],
            ),
          ),)


        ],
      ),
    );
  }
}
