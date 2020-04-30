import 'package:flutter/material.dart';

class SubsityGoodsListWidget extends StatefulWidget {
  String tabName;

  SubsityGoodsListWidget({@required this.tabName});

  @override
  _SubsityGoodsListWidgetState createState() => _SubsityGoodsListWidgetState();
}

class _SubsityGoodsListWidgetState extends State<SubsityGoodsListWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        key: PageStorageKey(widget.tabName),
        itemBuilder: (context, index) {
          return Center(child: Text('${index}'));
        },
        itemCount: 30,itemExtent: 80,
      ),
    );
  }
}
