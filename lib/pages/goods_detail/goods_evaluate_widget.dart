import 'package:flutter/material.dart';
import 'package:pingduoduo/pages/goods_detail/goods_evaluate_flag_widget.dart';
import 'package:pingduoduo/util/image_utls.dart';
import 'package:pingduoduo/widgets/container_divider.dart';
import 'package:pingduoduo/widgets/more_container_widget.dart';
import 'package:pingduoduo/widgets/text_bound_image.dart';

class GoodsEvaluateWidget extends StatelessWidget {
  String image = 'https://avatar2.pddpic.com/a/c07091bf9ea25c83a8e44689f469a8397336c31f-1528379868?imageMogr2/thumbnail/100x';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ContainerDivider(
            child: MoreContainerWidget(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  '商品评价(41)',
                  style: TextStyle(color: Color(0xff151516)),
                ),
              ),
              rightString: '查看全部',
            ),
            topDividerHeight: 10),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            runAlignment:WrapAlignment.start ,
            spacing: 3,
            runSpacing: 5,
            children: <Widget>[
            GoodsEvaluateFlagWidget(image: ImageUtils.getImagePath("icons/guarantee"),
              flag: "正品",backgroudColor: Color(0xffdaf8cd),flagColor: Color(0xff25b513)),

              GoodsEvaluateFlagWidget(
                  flag: "手机很好(3)",backgroudColor: Color(0xfffdefee),flagColor: Color(0xff58595B)),
              GoodsEvaluateFlagWidget(
                  flag: "发货快(3)",backgroudColor: Color(0xfffdefee),flagColor: Color(0xff58595B)),

              GoodsEvaluateFlagWidget(
                  flag: "物美价廉(2)",backgroudColor: Color(0xfffdefee),flagColor: Color(0xff58595B)),
            ],
          ),
        ),

        ContainerDivider(child: _createMemberEvaluateWidget('陈玉海',
        'https://avatar2.pddpic.com/a/c07091bf9ea25c83a8e44689f469a8397336c31f-1528379868?imageMogr2/thumbnail/100x',
            '正品   不错   运行杠杠的   拍照技术很强大  吃鸡无压力   小米就是香'),showTopDivider: false,bottomDividerLeftMargin: 8),
        ContainerDivider(child: _createMemberEvaluateWidget('李成',
            'https://avatar2.pddpic.com/a/Q0lEckplQTd2RllSdXN6SVB2YTFFSnp1cW5ycnZ5eEVPQT09djA0-1589456178?imageMogr2/thumbnail/100x',
            '发货很快，手机很好，客服很好，希望发票能快点寄过来。'),showTopDivider: false,bottomDividerHeight: 10),





      ],
    );
  }

  Widget _createMemberEvaluateWidget(String name,String image,String content){

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: TextBoundImage(text: name,leftImageUrl: image,imageRadius: 10),
          ),
          Text(content,style: TextStyle(color: Color(0xff58595b),fontSize: 16))
        ],
      ),
    );


  }




}
