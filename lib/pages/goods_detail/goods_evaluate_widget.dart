import 'package:flutter/material.dart';
import 'package:pingduoduo/pages/goods_detail/goods_evaluate_flag_widget.dart';
import 'package:pingduoduo/util/image_utls.dart';
import 'package:pingduoduo/widgets/container_divider.dart';
import 'package:pingduoduo/widgets/more_container_widget.dart';

class GoodsEvaluateWidget extends StatelessWidget {
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




      ],
    );
  }

  Widget _createMemberEvaluateWidget(){

    return Column(
      children: <Widget>[


      ],
    );


  }




}
