import 'package:flutter/material.dart';
import 'package:pingduoduo/widgets/container_divider.dart';
import 'package:pingduoduo/widgets/more_container_widget.dart';

class GoodsEvaluateWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
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
        Wrap(
          children: <Widget>[


          ],
        )


      ],
    );
  }
}
