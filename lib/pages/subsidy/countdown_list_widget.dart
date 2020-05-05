import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pingduoduo/bean/subsidy_header_group_bean.dart';
import 'package:pingduoduo/util/utils.dart';
import 'package:pingduoduo/widgets/circular_image_widget.dart';

class CountDownWidget extends StatefulWidget {
  @override
  _CountDownWidgetState createState() => _CountDownWidgetState();
}

class _CountDownWidgetState extends State<CountDownWidget> with TickerProviderStateMixin{

  List<SubsidyHeaderGroupBean> headerDatas = List();
  int itemCount;
  Timer timer;
  int ss = 36000000;
  String aaa;


  @override
  void initState() {
    super.initState();



    headerDatas.add(SubsidyHeaderGroupBean(title: '现货hpv疫苗全国预约',imaegUrl: 'https://t00img.yangkeduo.com/goods/2020-04-24/76a8c447c04ee6f3f8fc70a8168d10da.jpeg?imageMogr2/sharpen/50/strip%7CimageView2/2/w/240/q/70/format/webp',
    milliSecond: 36000000,
        nearBuyImage: ['https://t20img.yangkeduo.com/a/10c4e50a782e5a8767071d4c784a50d3ae9f2a9b-1569647479?imageMogr2/sharpen/50/strip%7CimageView2/2/w/32/q/70/format/webp',
        'https://t20img.yangkeduo.com/a/9d6ed2084e4a4209b6b45f96fb034ebe4717121b-1586854023?imageMogr2/sharpen/50/strip%7CimageView2/2/w/32/q/70/format/webp',
        'https://t20img.yangkeduo.com/a/62074f6d6dfbdcdb14599d5426847e444ae1e19a-1586772257?imageMogr2/sharpen/50/strip%7CimageView2/2/w/32/q/70/format/webp'],
        saleNumber: "1020件已抢",price: '1896'));

    headerDatas.add(SubsidyHeaderGroupBean(title: '美的双胆5L电压力锅',imaegUrl: 'https://t00img.yangkeduo.com/goods/images/2020-04-26/aea5aa0a53ceb3b15b4250676eeb3ed9.jpeg?imageMogr2/sharpen/50/strip%7CimageView2/2/w/240/q/70/format/webp',
        milliSecond: 86400000,
        nearBuyImage: ['https://t20img.yangkeduo.com/a/10c4e50a782e5a8767071d4c784a50d3ae9f2a9b-1569647479?imageMogr2/sharpen/50/strip%7CimageView2/2/w/32/q/70/format/webp',
          'https://t20img.yangkeduo.com/a/9d6ed2084e4a4209b6b45f96fb034ebe4717121b-1586854023?imageMogr2/sharpen/50/strip%7CimageView2/2/w/32/q/70/format/webp',
          'https://t20img.yangkeduo.com/a/62074f6d6dfbdcdb14599d5426847e444ae1e19a-1586772257?imageMogr2/sharpen/50/strip%7CimageView2/2/w/32/q/70/format/webp'],
        saleNumber: "1020件已抢",price: '3456'));
    headerDatas.add(SubsidyHeaderGroupBean(title: '55折别克英朗19款',imaegUrl: 'https://t00img.yangkeduo.com/goods/images/2020-04-28/27cecf6edee6d433b59920188af596a6.jpeg?imageMogr2/sharpen/50/strip%7CimageView2/2/w/240/q/70/format/webp',
        milliSecond: 43200000,
        nearBuyImage: ['https://t20img.yangkeduo.com/a/10c4e50a782e5a8767071d4c784a50d3ae9f2a9b-1569647479?imageMogr2/sharpen/50/strip%7CimageView2/2/w/32/q/70/format/webp',
          'https://t20img.yangkeduo.com/a/9d6ed2084e4a4209b6b45f96fb034ebe4717121b-1586854023?imageMogr2/sharpen/50/strip%7CimageView2/2/w/32/q/70/format/webp',
          'https://t20img.yangkeduo.com/a/62074f6d6dfbdcdb14599d5426847e444ae1e19a-1586772257?imageMogr2/sharpen/50/strip%7CimageView2/2/w/32/q/70/format/webp'],
        saleNumber: "1020件已抢",price: '289'));

    headerDatas.add(SubsidyHeaderGroupBean(title: '雪佛兰科沃兹2020款',imaegUrl: 'https://t00img.yangkeduo.com/goods/images/2020-04-28/9c0d213ecb7bc92d24a04f8d626b4947.jpeg?imageMogr2/sharpen/50/strip%7CimageView2/2/w/240/q/70/format/webp',
        milliSecond: 3600000,
        nearBuyImage: ['https://t20img.yangkeduo.com/a/10c4e50a782e5a8767071d4c784a50d3ae9f2a9b-1569647479?imageMogr2/sharpen/50/strip%7CimageView2/2/w/32/q/70/format/webp',
          'https://t20img.yangkeduo.com/a/9d6ed2084e4a4209b6b45f96fb034ebe4717121b-1586854023?imageMogr2/sharpen/50/strip%7CimageView2/2/w/32/q/70/format/webp',
          'https://t20img.yangkeduo.com/a/62074f6d6dfbdcdb14599d5426847e444ae1e19a-1586772257?imageMogr2/sharpen/50/strip%7CimageView2/2/w/32/q/70/format/webp'],
        saleNumber: "100件已抢",price: '28449'));

    itemCount =headerDatas.length +2; //预留出左右两边的 padding

    _countdown();
  }
@override
  void dispose() {
    timer?.cancel();
    timer = null;
    super.dispose();
  }

  void _countdown(){

    timer = Timer.periodic(Duration(seconds: 1), (Timer timer){
//      if(mounted) {
       setState(() {

         aaa = Utils.convertMillisecond(ss);
            ss-=1000;
       });


//        }
    });

  }



  @override
  Widget build(BuildContext context) {

    return ListView.separated(
      scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
        if(index == 0 || itemCount-1 == index){
          return Container(
            width: 10,
            color: Colors.transparent
          );
        }else{

          return _createItemWidget(headerDatas[index-1]);

        }

        },
        separatorBuilder: (context, index) {
          return VerticalDivider(
            width: 10,color: Colors.transparent,
          );
        },

        itemCount: itemCount);
  }

  Widget _createItemWidget(SubsidyHeaderGroupBean bean){

    const TextStyle textStyle = TextStyle(
        color: Color(0xffff7447),fontWeight: FontWeight.w700,fontSize: 10
    );
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        width: ScreenUtil.getInstance().setWidth(500),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //头部标题
            Container(
              decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xfffff4de),Color(0xffffe7cc)])),
              height: ScreenUtil.getInstance().setHeight(70),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(child: Center(child: Text('万人团',style: textStyle)),padding: EdgeInsets.symmetric(horizontal: 5),),

                  VerticalDivider(width: 10,thickness: 1, endIndent: 5,indent: 5,color: const Color(0xffff7447),),
                  Expanded(child: Center(child: Text(bean.title,style: textStyle,))),

                ],
              ),
            ),
            //内容部分
            Expanded(child: Row(
              children: <Widget>[
                CachedNetworkImage(imageUrl: bean.imaegUrl,width: ScreenUtil.getInstance().setWidth(200)),
                Expanded(child: Column(
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
                      child: Center(child: Text('距离结束 ${aaa}',style: TextStyle(color: Colors.white,fontSize: 12))),
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
                             children: _createNearBuyGroup(bean.nearBuyImage),

                            ),
                          ),
                          Expanded(
                            flex: 3,
                              child: Text(bean.saleNumber,style: TextStyle(fontSize: 11,color: Color(0xff9c9c9c)))),
                        ],
                      ),
                    ),

                    Expanded(child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          Container(
                            margin: EdgeInsets.only(bottom: 3,left: 2),
                            child: Text.rich(
                                TextSpan(
                                  style: TextStyle(color: Color(0xfff85064),fontSize: 12),
                                    children: [

                              TextSpan(
                                text: '补贴价'
                              ),
                              TextSpan(
                                text: ' ¥',
                              ),
                              TextSpan(
                                text: bean.price,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600)
                              )

                            ])),
                          )
                        ],
                      ),
                    ))


                  ],
                ),)



              ],
            ))


          ],
        ),

      ),
    );


  }


  List<Widget> _createNearBuyGroup(List<String> images){

    double offsetLeft = 0;
    List<Widget> widgets = List();
    for (int i = 0; i < images.length; i++) {

      widgets.add(Positioned(
        left: offsetLeft,
          child: CirculuarImageWidget( ScreenUtil.getInstance().setWidth(50),images[i])));

      offsetLeft+=10;
    }

    return widgets;


  }



}
