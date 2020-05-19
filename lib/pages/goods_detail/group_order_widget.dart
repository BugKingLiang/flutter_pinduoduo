import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:pingduoduo/util/color_constant.dart';
import 'package:pingduoduo/widgets/circular_image_widget.dart';
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
          topDividerHeight: 10,
          showBottomDivider: false,
        ),
        Container(
          height: ScreenUtil.getInstance().setHeight(300),
          child: Swiper(
              scrollDirection: Axis.vertical,
              itemCount: 10,
              autoplay: true,
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: ContainerDivider(
                          child: Expanded(
                        child: Container(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Stack(
                                  alignment: Alignment.centerLeft,
                                  children: <Widget>[
                                    CirculuarImageWidget(30,
                                        'https://avatar2.pddpic.com/a/36ce32113e666aa5cb2283368a36beeb170be1dc-1587861339?imageMogr2/thumbnail/100x'),
                                    Positioned(
                                        left: 15,
                                        child: CirculuarImageWidget(30,
                                            'https://avatar2.pddpic.com/a/9c577248e99970f0215a6d0e5aecbec785e7955b-1581928426?imageMogr2/thumbnail/100x')),
                                  ],
                                ),
                              ),
                              Expanded(flex: 5, child: Text('风吹屁屁 、司徒国能')),
                              FlatButton(
                                onPressed: () {
                                  print('========================');
                                },
                                child: Text(
                                  '去拼单',
                                  style: TextStyle(color: Colors.white),
                                ),
                                color: Color(0xffe02e24),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                              )
                            ],
                          ),
                        )),
                      )),
                    ),
                    Expanded(
                      child: ContainerDivider(
                        child: Expanded(
                          child: Container(
                              child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: <Widget>[
                                      CirculuarImageWidget(30,
                                          'https://avatar2.pddpic.com/a/36ce32113e666aa5cb2283368a36beeb170be1dc-1587861339?imageMogr2/thumbnail/100x'),
                                    ],
                                  ),
                                ),
                                Expanded(flex: 5, child: Text('JKey')),
                                FlatButton(
                                  onPressed: () {},
                                  child: Text(
                                    '去拼单',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  color: Color(0xffe02e24),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                )
                              ],
                            ),
                          )),
                        ),
                        showTopDivider: false,
                      ),
                    )
                  ],
                );
              }),
        )
      ],
    );
  }
}
