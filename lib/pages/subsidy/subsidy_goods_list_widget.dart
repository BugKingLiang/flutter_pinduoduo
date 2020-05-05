import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pingduoduo/pages/subsidy/goods_item_widget.dart';
import 'package:pingduoduo/storage/mock_data.dart';

class SubsityGoodsListWidget extends StatefulWidget {
  String tabName;

  SubsityGoodsListWidget({@required this.tabName});

  @override
  _SubsityGoodsListWidgetState createState() => _SubsityGoodsListWidgetState();
}

class _SubsityGoodsListWidgetState extends State<SubsityGoodsListWidget> {

  List data;

  @override
  void initState() {
    super.initState();
    data = json.decode(MockData.subsidy_popular_data)['goods_list'] as List;

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        key: PageStorageKey(widget.tabName),
        itemBuilder: (context, index) {
          return GoodsItemWidget(data[index]);
        },
        itemCount: data.length,
      ),
    );
  }
}
