import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pingduoduo/bean/subsidy_header_group_bean.dart';
import 'package:pingduoduo/provider/countdown_provider.dart';
import 'package:pingduoduo/storage/mock_data.dart';
import 'package:pingduoduo/util/utils.dart';
import 'package:pingduoduo/widgets/circular_image_widget.dart';
import 'package:provider/provider.dart';

class CountDownWidget extends StatefulWidget {
  @override
  _CountDownWidgetState createState() => _CountDownWidgetState();
}

class _CountDownWidgetState extends State<CountDownWidget>
    with TickerProviderStateMixin {
  List<SubsidyHeaderGroupBean> headerDatas;

  int itemCount;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    headerDatas = Provider.of<CountDownProvider>(context).subsidyHeaderData;
    itemCount = headerDatas.length + 2; //预留出左右两边的 padding
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          if (index == 0 || itemCount - 1 == index) {
            return Container(width: 10, color: Colors.transparent);
          } else {
            return _createItemWidget(headerDatas[index - 1]);
          }
        },
        separatorBuilder: (context, index) {
          return VerticalDivider(
            width: 10,
            color: Colors.transparent,
          );
        },
        itemCount: itemCount);
  }

  Widget _createItemWidget(SubsidyHeaderGroupBean bean) {
    const TextStyle textStyle = TextStyle(
        color: Color(0xffff7447), fontWeight: FontWeight.w700, fontSize: 10);
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        width: ScreenUtil.getInstance().setWidth(600),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //头部标题
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xfffff4de), Color(0xffffe7cc)])),
              height: ScreenUtil.getInstance().setHeight(70),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    child: Center(child: Text('万人团', style: textStyle)),
                    padding: EdgeInsets.symmetric(horizontal: 5),
                  ),
                  VerticalDivider(
                    width: 10,
                    thickness: 1,
                    endIndent: 5,
                    indent: 5,
                    color: const Color(0xffff7447),
                  ),
                  Expanded(
                      child: Center(
                          child: Text(
                    bean.title,
                    style: textStyle,
                  ))),
                ],
              ),
            ),
            //内容部分
            Expanded(
                child: Row(
              children: <Widget>[
                CachedNetworkImage(
                    imageUrl: bean.imaegUrl,
                    width: ScreenUtil.getInstance().setWidth(200)),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      //倒计时组件
                      Container(
                        margin: EdgeInsets.all(3),
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: Color(0xfff85064),
                        ),
                        //
                        child: Center(child: Consumer<CountDownProvider>(
                            builder: (BuildContext context,
                                CountDownProvider value, Widget child) {
                          String text = bean.milliSecond <= 0
                              ? '活动已结束'
                              : '距离结束 ${bean.timer}';

                          return Text(text,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12));
                        })),
                      ),

                      Container(
                        height: ScreenUtil.getInstance().setHeight(70),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: Stack(
                                alignment: Alignment.topLeft,
                                children:
                                    _createNearBuyGroup(bean.nearBuyImage),
                              ),
                            ),
                            Expanded(
                                flex: 3,
                                child: Text(bean.saleNumber,
                                    style: TextStyle(
                                        fontSize: 11,
                                        color: Color(0xff9c9c9c)))),
                          ],
                        ),
                      ),

                      Expanded(
                          child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(bottom: 3, left: 2),
                              child: Text.rich(TextSpan(
                                  style: TextStyle(
                                      color: Color(0xfff85064), fontSize: 12),
                                  children: [
                                    TextSpan(text: '补贴价'),
                                    TextSpan(
                                      text: ' ¥',
                                    ),
                                    TextSpan(
                                        text: bean.price,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600))
                                  ])),
                            )
                          ],
                        ),
                      ))
                    ],
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }

  List<Widget> _createNearBuyGroup(List<String> images) {
    double offsetLeft = 0;
    List<Widget> widgets = List();
    for (int i = 0; i < images.length; i++) {
      widgets.add(Positioned(
          left: offsetLeft,
          child: CirculuarImageWidget(
              ScreenUtil.getInstance().setWidth(50), images[i])));

      offsetLeft += 10;
    }

    return widgets;
  }
}
