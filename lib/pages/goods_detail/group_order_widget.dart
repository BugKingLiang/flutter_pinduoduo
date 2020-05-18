import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:pingduoduo/util/color_constant.dart';
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
        ContainerDivider(
            child: MoreContainerWidget(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('这些人刚刚购买成功，可参与拼单',
                    style: TextStyle(color: Color(0xff151516))),
              ),
              rightString: '查看更多',
            ),
            topDividerHeight: 10),
        IgnorePointer(
          child: Container(
            height: 120,
            child: Swiper(
                scrollDirection:Axis.vertical,
                itemCount: 10, autoplay: true, itemBuilder: (context, index) {
              return Column(
                children: <Widget>[
                  ContainerDivider(child: Container(height: 50,color: ColorConstant.getRandomColor())),
                  ContainerDivider(child: Container(height: 50,color: ColorConstant.getRandomColor()))
                ],
              );

            }),
          ),
        )
      ],
    );
  }
}
