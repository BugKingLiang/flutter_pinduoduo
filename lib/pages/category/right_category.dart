import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pingduoduo/provider/category_provider.dart';
import 'package:pingduoduo/storage/http/api.dart';
import 'package:pingduoduo/util/color_constant.dart';
import 'package:pingduoduo/util/utils.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RightCategoryWidget extends StatefulWidget {
  @override
  _RightCategoryWidgetState createState() => _RightCategoryWidgetState();
}

class _RightCategoryWidgetState extends State<RightCategoryWidget> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  String _categoryId;
  var _categoryData;

  List _goodsData = List(); //商品数据

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var id = Provider.of<CategoryProvider>(context).id;
    if (_categoryId != id) {
      _goodsData.clear();
      _loadCategoryData(id);
      _categoryId = id;
      return Container(child: Center(child: Text('数据加载中')));
    } else {
      return Container(child: _createOtherCategoryWidget(_categoryData));
    }
  }

  Widget _createHeaderWidget(String title, String image) {
    return Container(
      height: ScreenUtil.getInstance().setHeight(80),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                title,
                style: TextStyle(fontSize: 16),
              )),
          Offstage(
              offstage: image == null,
              child: Container(
                child: Image(
                    image: CachedNetworkImageProvider(image??""),
                    fit: BoxFit.fill,
                    height: ScreenUtil.getInstance().setWidth(50)),
              )),
        ],
      ),
    );
  }

  Widget _createGrideView(List data) {
    return Container(
      child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: data.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (context, index) {
            var image = data[index]['image_url'];
            var name = data[index]['opt_name'];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    width: ScreenUtil.getInstance().setWidth(200),
                    height: ScreenUtil.getInstance().setWidth(200),
                    child: Image(
                        image: CachedNetworkImageProvider(image),
                        fit: BoxFit.fill)),
                Text(name,
                    style: TextStyle(fontSize: 12, color: Color(0xff58595b)))
              ],
            );
          }),
    );
  }

  Widget _crateSectionWidget(var data) {
    var headerName = data['opt_name'];
    var trailingImage = data['icon_url'];
    var childrenData = data['children'] as List;

    return Container(
        child: Column(
      children: <Widget>[
        _createHeaderWidget(headerName, trailingImage),
        _createGrideView(childrenData)
      ],
    ));
  }

  //商品属性item
  Widget _createGoodsItemWidget(
      String goodsImage, String goodsName, int goodsPrice, int sales) {
    double itemHeight = ScreenUtil().setHeight(400);

    return Container(
      color: Colors.white,
      height: itemHeight,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            Container(
                width: itemHeight,
                height: itemHeight,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Image(
                      image: CachedNetworkImageProvider(goodsImage),
                      fit: BoxFit.fill),
                )),
            Expanded(
                child: Container(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    goodsName,
                    maxLines: 2,
                    textAlign: TextAlign.left,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(
                      'xxxxxx专营店',
                      style: TextStyle(color: ColorConstant.text_gray),
                      maxLines: 1,
                    ),
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
//                      Text('111111111111111111'),
                      Row(
                        children: <Widget>[
                          Text.rich(
                            TextSpan(children: [
                              TextSpan(
                                  text: '¥', style: TextStyle(fontSize: 12)),
                              TextSpan(
                                  text: Utils.convertPrice(goodsPrice),
                                  style: TextStyle(fontSize: 16))
                            ]),
                            style: TextStyle(
                                color: Color(0xffe02e24),
                                fontWeight: FontWeight.w700),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 3),
                            child: Text(Utils.calculateSales(sales),
                                style: TextStyle(
                                    color: ColorConstant.text_gray,
                                    fontSize: 12)),
                          ),
                        ],
                      ),
                    ],
                  ))
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  Widget _createOtherCategoryWidget(var data) {
    var bannderInfo = data['banner_info'];
    List categoryData = data['children'] as List;

    return SmartRefresher(
      enablePullDown: false,
      enablePullUp: _categoryId != '0',
      //不是推荐分类的时候开启加载更多
      controller: _refreshController,
      onLoading: _loadRequest,
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Offstage(
              offstage: bannderInfo == null,
              child: Container(
                  height: ScreenUtil.getInstance().setHeight(300),
                  padding: EdgeInsets.all(5),
                  child: Image(
                      image: CachedNetworkImageProvider(
                          bannderInfo != null ? bannderInfo['image_url'] : ''),
                      fit: BoxFit.fill)),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            if (index < categoryData.length) {
              var itemData = categoryData[index];
              return _crateSectionWidget(itemData);
            } else {
              var goods = _goodsData[index - categoryData.length];
              return _createGoodsItemWidget(goods['hd_thumb_url'],
                  goods['goods_name'], goods['normal_price'], goods['cnt']);
            }
          }, childCount: categoryData.length + _goodsData.length)),
        ],
      ),
    );
  }

  void _loadCategoryData(String id) {
    Api.instance.requestCategoryData(id).then((response) {
      setState(() {
        _categoryData = id == '0' ? response : (response as Response).data;
      });
    });
  }

  void _loadRequest() {
    Api.instance.requestCategoryGroupData().then((response) {
      setState(() {
        _goodsData.addAll(response['goods_list']);
      });
    });

    _refreshController.loadComplete();
  }
}
