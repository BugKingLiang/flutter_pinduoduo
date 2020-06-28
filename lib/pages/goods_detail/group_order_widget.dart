import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:pingduoduo/util/color_constant.dart';
import 'package:pingduoduo/util/image_utls.dart';
import 'package:pingduoduo/widgets/circular_image_widget.dart';
import 'package:pingduoduo/widgets/container_divider.dart';
import 'package:pingduoduo/widgets/more_container_widget.dart';

//拼单列表
class GroupOrderWidget extends StatefulWidget {
  @override
  _GroupOrderWidgetState createState() => _GroupOrderWidgetState();
}

class _GroupOrderWidgetState extends State<GroupOrderWidget> {
  String _groupOrderDialog = 'group_order_dialog';
  var dialog;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ContainerDivider(
          child: GestureDetector(
            onTap: () {
              showGroupOrderDialog(context);
            },
            child: MoreContainerWidget(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('这些人刚刚购买成功，可参与拼单',
                    style: TextStyle(color: Color(0xff151516))),
              ),
              rightString: '查看更多',
            ),
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

  void showGroupOrderDialog(BuildContext context) {
    dialog = showGeneralDialog<String>(
        context: context,
        barrierDismissible: true,
        barrierLabel: '',
        barrierColor: Colors.black.withOpacity(0.7),
        transitionDuration: Duration(milliseconds: 200),
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return Center(
            child: Container(
              width: 300,
              height: 500,
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context, rootNavigator: true)
                            .pop(_groupOrderDialog);
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xffe0e0e0)),
                        child: Image.asset(
                          ImageUtils.getImagePath('icons/close'),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text('可参与的拼单',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xff151516),
                                        decoration: TextDecoration.none)),
                              ),
//                        Expanded(child: Container(color: Colors.redAccent))

                              Expanded(
                                child: Container(
                                  child: ListView.separated(
                                      shrinkWrap: true,
                                      padding: EdgeInsets.all(0),
                                      itemBuilder: (context, index) {
                                        return ContainerDivider(
                                            child: Container(
                                                child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              Expanded(
                                                flex: 2,
                                                child: Stack(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  children: <Widget>[
                                                    CirculuarImageWidget(30,
                                                        'https://avatar2.pddpic.com/a/36ce32113e666aa5cb2283368a36beeb170be1dc-1587861339?imageMogr2/thumbnail/100x'),
                                                    Positioned(
                                                        left: 15,
                                                        child: CirculuarImageWidget(
                                                            30,
                                                            'https://avatar2.pddpic.com/a/9c577248e99970f0215a6d0e5aecbec785e7955b-1581928426?imageMogr2/thumbnail/100x')),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                  flex: 5,
                                                  child: Text('风吹屁屁 、司徒国能',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color:
                                                              Color(0xff151516),
                                                          decoration:
                                                              TextDecoration
                                                                  .none))),
                                              FlatButton(
                                                onPressed: () {
                                                  print(
                                                      '========================');
                                                },
                                                child: Text(
                                                  '去拼单',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                color: Color(0xffe02e24),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                              )
                                            ],
                                          ),
                                        )));
                                      },
                                      separatorBuilder: (context, index) {
                                        return Divider(
                                          thickness: 1,
                                          height: 1,
                                        );
                                      },
                                      itemCount: 10),
                                ),
                              )
                            ],
                          ),
                        )),
                  )
                ],
              ),
            ),
          );
        });
  }
}
