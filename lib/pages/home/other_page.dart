import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pingduoduo/http/mock_data.dart';
import 'package:pingduoduo/pages/home/widgets/other_widgets.dart';
import 'package:pingduoduo/widgets/goods_info_widget.dart';

class OtherPage extends StatefulWidget {
  @override
  _OtherPageState createState() => _OtherPageState();
}

class _OtherPageState extends State<OtherPage> {
  var _topData;
  List _goodsData;

  @override
  void initState() {
    super.initState();

    _topData = json.decode(MockData.other_top_category);
    _goodsData = json.decode(MockData.other_goods)['list'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: OtherWidgets(_topData['data']),
        ),
        _createGoodsGridView(_goodsData)
      ],
    ));
  }

  SliverGrid _createGoodsGridView(List goods) {
    return SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 2, childAspectRatio: 0.7),
        delegate: SliverChildBuilderDelegate((context, index) {
          var item = goods[index];
          var iconList = item['icon_list'];
          return GoodsInfoWidget(
              item['hd_thumb_url'],
              //切记不要直接使用ScreenUtil.getInstance().width/2
              ScreenUtil.getInstance().setWidth(ScreenUtil.getInstance().width/2),
              iconList != null ? iconList[0]['url'] : null,
              item['goods_name'],
              item['tag_list'],
              item['min_on_sale_group_price'],
              item['sales_tip'],
              item['near_group']['list'],lrWidget: LowerRightWidget.near_group);
        }));
  }
}
