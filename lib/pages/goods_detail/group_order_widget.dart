import 'package:flutter/material.dart';
import 'package:pingduoduo/widgets/container_divider.dart';
import 'package:pingduoduo/widgets/more_container_widget.dart';

//拼单列表
class GroupOrderWidget extends StatefulWidget {
  @override
  _GroupOrderWidgetState createState() => _GroupOrderWidgetState();
}

class _GroupOrderWidgetState extends State<GroupOrderWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ContainderDivider(
          child: MoreContainerWidget(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('这些人刚刚购买成功，可参与拼单'),
            ),
            rightString: '查看更多',
          ),
          topDividerHeight: 10
        )
      ],
    );
  }
}
