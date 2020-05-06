import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pingduoduo/util/utils.dart';
import 'package:pingduoduo/widgets/divider_dart.dart';
import 'package:pingduoduo/widgets/goods_info_title_widget.dart';

import 'overlay_image_widget.dart';

class GoodsItemWidget extends StatelessWidget {
  String brandName;
  String leadingIcon =
      'https://pinduoduoimg.yangkeduo.com/pincard/ba_tag_old.png?imageMogr2/sharpen/50/strip%7CimageView2/2/w/159/q/100/format/webp';
  List tagInfoList;

  String subsityPrice; //补贴价格
  String originPriceWord; //全网低价
  String salesWording; //已补贴xxx件

  var goodsInfo;

  GoodsItemWidget(this.goodsInfo) {
    brandName = goodsInfo['brand_name'];
    tagInfoList = goodsInfo['tag_info_list'];
    subsityPrice = Utils.convertPrice(goodsInfo['activity_price']);
    originPriceWord = Utils.convertPrice(goodsInfo['origin_price']);
    salesWording = goodsInfo['sales_wording'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: ScreenUtil.getInstance().setHeight(450),
      child: Row(
        children: <Widget>[
          Container(
            width: ScreenUtil.getInstance().setHeight(400),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OverlayImageWidget(image: goodsInfo['hd_thumb_url']),
                ),
                Positioned(
                  bottom: 0,left: 12,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 3),
                        child: Text(brandName,style: TextStyle(color: Colors.white,fontSize: 12)),
                    color: Color(0xffd8a38d),
                    alignment: Alignment.center))

              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: GoodsInfoTitleWidget(
                        leadingIcons: [leadingIcon],
                        title: goodsInfo['short_name']),
                  ),
                  Offstage(
                      offstage: tagInfoList == null || tagInfoList.isEmpty,
                      child: Container(
                        margin: EdgeInsets.only(top: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            border: Border.all(color: Color(0xffffd6a56a))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                              '${tagInfoList != null && tagInfoList.isNotEmpty ? tagInfoList[0]['text'] : ''}',
                              style: TextStyle(
                                  color: Color(0xffffd6a56a), fontSize: 10)),
                        ),
                      )),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Offstage(
                        offstage: originPriceWord == null,
                        child: Text('全网最低价 ¥${originPriceWord}',
                            style: TextStyle(color: Color(0xff9c9c9c))),
                      ),

                      //价格,销量
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text.rich(TextSpan(
                              style: TextStyle(color: Color(0xffe02e24)),
                              children: [
                                TextSpan(
                                    text: '补贴价格',
                                    style: TextStyle(fontSize: 12)),
                                TextSpan(
                                    text: ' ¥',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700)),
                                TextSpan(
                                    text: subsityPrice,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700)),
                              ])),
                          Text(salesWording,
                              style: TextStyle(color: Color(0xff9c9c9c),fontSize: 12))
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: DividerWidget(
                          height: 1,
                        ),
                      )
                    ],
                  ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
