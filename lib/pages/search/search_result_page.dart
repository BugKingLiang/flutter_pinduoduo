import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pingduoduo/pages/search/goods_info_widget.dart';
import 'package:pingduoduo/pages/search/search_result_header_widget.dart';
import 'package:pingduoduo/storage/mock_data.dart';
import 'package:pingduoduo/util/image_utls.dart';
import 'package:pingduoduo/widgets/popup_fliter_widget.dart';
import 'package:pingduoduo/widgets/popup_triangle_indicator_widget.dart';
import 'package:pingduoduo/widgets/search_widget.dart';
import 'package:toast/toast.dart';

//搜索结果页

class SearchResoutPage extends StatefulWidget {

  var searchKey;


  SearchResoutPage(this.searchKey);

  @override
  _SearchResoutPageState createState() => _SearchResoutPageState();
}

class _SearchResoutPageState extends State<SearchResoutPage> {
  GlobalKey _globalKey = GlobalKey();
  GlobalKey _fliterKey = GlobalKey();

  var data;
  PopupTriangleIndicator _popupTriangleIndicator;
  PopupFliterWidget _popupFliterWidget;
  List goodsData;

  @override
  void initState() {
    super.initState();
    _popupTriangleIndicator = PopupTriangleIndicator();
    _popupFliterWidget = PopupFliterWidget();
    data = json.decode(MockData.search_result_data);
    goodsData = data['items'];


  }

  @override
  void dispose() {
    _popupTriangleIndicator.dismiss();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
            elevation: 0,
            brightness: Brightness.light,
            backgroundColor: Colors.white),
        preferredSize: Size.fromHeight(0),
      ),
      body: WillPopScope(
        onWillPop: () {
          if (_popupTriangleIndicator.isShowing) {
            _popupTriangleIndicator.dismiss();
            return Future.value(false);
          } else if (_popupFliterWidget.isShow) {
            _popupFliterWidget.dismiss();
            return Future.value(false);
          }
          else {
            return Future.value(true);
          }
        },
        child: GestureDetector(
          onTapDown: (down) {
            _popupTriangleIndicator.dismiss();
          },
          child: Container(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  floating: true,
                  elevation: 0,
                  backgroundColor: Colors.white,
                  flexibleSpace: Container(
                      child: SearchWidget(widget.searchKey,
                          searchType: SearchType.SEARCH_RESULT_TYPE)),
                ),
                SliverPersistentHeader(
                  delegate: HeaderWidget(
                      _globalKey,
                      _fliterKey,
                      ScreenUtil().setHeight(120),
                          () {
                    _popupTriangleIndicator.show(_globalKey, (result) {
                      _popupTriangleIndicator.dismiss();
                    });
                  },
                      (){
                        _popupFliterWidget.show(_fliterKey);

                      }),
                  pinned: true,
                ),
                SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                  if (index == 0) {
                    return SearchResultHeaderWidget();
                  }
                  var goodsModel =
                      goodsData[index - 1]['item_data']['goods_model'];

                  return GoodsInfoWidget(
                      goodsModel['thumb_url'],
                      goodsModel['icon_list'],
                      goodsModel['goods_name'],
                      goodsModel['prop_tag_list'],
                      goodsModel['tag_list'],
                      goodsModel['near_group'] != null
                          ? goodsModel['near_group']['list']
                          : null,
                      goodsModel['price'],
                      goodsModel['sales']);
                }, childCount: goodsData.length + 1))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HeaderWidget extends SliverPersistentHeaderDelegate {
  double childHeight;

  VoidCallback topCallback;
  VoidCallback fliterCallback;
  Key comprehensiveKey;
  Key fliterKey;


  HeaderWidget(this.comprehensiveKey, this.fliterKey,this.childHeight, this.topCallback,this.fliterCallback);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      height: childHeight,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        topCallback();
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '综合',
                            key: comprehensiveKey,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 3),
                            child: SvgPicture.asset(
                              ImageUtils.getSvgImagePath('triangle_down'),
                              fit: BoxFit.cover,
                              width: ScreenUtil().setWidth(30),
                              height: ScreenUtil().setWidth(30),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Center(
                        child: Text('销量'),
                      )),
                  Expanded(
                    flex: 1,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('价格'),
                        Container(
                          margin: EdgeInsets.only(left: 3),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SvgPicture.asset(
                                ImageUtils.getSvgImagePath('triangle_up_normal'),
                                fit: BoxFit.cover,
                                width: ScreenUtil().setWidth(25),
                                height: ScreenUtil().setWidth(25),
                              ),
                              SvgPicture.asset(
                                ImageUtils.getSvgImagePath('triangle_down_normal'),
                                fit: BoxFit.cover,
                                width: ScreenUtil().setWidth(25),
                                height: ScreenUtil().setWidth(25),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    color: Colors.grey,
                    width: ScreenUtil().setWidth(1),
                    height: childHeight,
                  ),
                  Expanded(
                      flex: 1,
                      child: Center(
                        child: Text('品牌'),
                      )),
                  Expanded(
                    flex: 1,
                    child: Listener(
                      onPointerDown: (event){

                        fliterCallback();
                      },
                      child: Row(
                        key: fliterKey,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('综合'),
                          Container(
                            margin: EdgeInsets.only(left: 3),
                            child: SvgPicture.asset(
                              ImageUtils.getSvgImagePath('filter'),
                              fit: BoxFit.cover,
                              width: ScreenUtil().setWidth(30),
                              height: ScreenUtil().setWidth(30),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(height: 1,thickness: ScreenUtil().setHeight(1))
        ],
      ),
    );
  }

  @override
  double get maxExtent => childHeight;

  @override
  double get minExtent => childHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return this != oldDelegate;
  }
}
