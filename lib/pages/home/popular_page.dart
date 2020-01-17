import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:pingduoduo/pages/home/goods_item_widget.dart';
import 'package:pingduoduo/pages/home/subsidy_widget.dart';
import 'package:pingduoduo/pages/home/widgets/horizontal_slide_widgets.dart';
import 'package:pingduoduo/storage/http/api.dart';
import 'package:pingduoduo/widgets/quick_back_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'grid_category_widget.dart';

class PopularPage extends StatefulWidget {
  @override
  _PopularPageState createState() => _PopularPageState();
}

class _PopularPageState extends State<PopularPage>
    with AutomaticKeepAliveClientMixin {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  bool _showToTopBtn = false;
  ScrollController _scrollController = new ScrollController();

  //顶部SwiperWidget数据
  List topSwiperData;

  int _page = 0; //当前页

  List _goodsList = List();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset < 1000 && _showToTopBtn) {
        setState(() {
          _showToTopBtn = false;
        });
      } else if (_scrollController.offset >= 1000 && _showToTopBtn == false) {
        setState(() {
          _showToTopBtn = true;
        });
      }
    });
    topSwiperData = [
      'http://t00img.yangkeduo.com/goods/2019-12-08/92d61afc4be1a0d79dead7e8074ac483.jpeg?imageMogr2/format/webp/quality/50',
      'http://t16img.yangkeduo.com/img_check/2019-12-07/ede2b4e5fbe643505a23dafb5210e742.jpg?imageMogr2/format/webp/quality/50',
      'http://t16img.yangkeduo.com/phone_adx/b882d1ed637e3825aa490c63be0f95a7.jpg?imageMogr2/format/webp/quality/50',
      'http://t16img.yangkeduo.com/img_check/2019-12-06/0e95d16ccc2f02f7efebc6baea9207b2.jpg?imageMogr2/format/webp/quality/50',
      'http://t16img.yangkeduo.com/img_check/2019-12-01/9ab63df656c150bf72d773b4cc17b077.jpg?imageMogr2/format/webp/quality/50'
    ];
    _loadMoreData();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    _refreshController.dispose();
  }

  void _loadMoreData() {
    Api.instance.requestHomeData(_page + 1).then((response) {
      if (response.data['goods_list'] != null) {
        //只有有数据的时候才出刷新
        _goodsList.addAll(response.data['goods_list'] as List);
        if (response.data['horizontal_slide_list'] != null) {
          //第二页是没有数据的
          if (_page == 0) {
            List horizontalSlideList = response.data['horizontal_slide_list'];
            for (int i = 0; i < horizontalSlideList.length; i++) {
              _goodsList.insert((i + 1) * 4, horizontalSlideList[i]);
            }
          }
        }
        _page++;

        if (mounted) setState(() {});
        if (_refreshController.isLoading) {
          _refreshController.loadComplete();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          !_showToTopBtn ? null : QuickBackWidget(_scrollController),
      body: Container(
        child: SmartRefresher(
            enablePullDown: false,
            enablePullUp: true,
            controller: _refreshController,
            onLoading: _loadMoreData,
            child: CustomScrollView(
              controller: _scrollController,
              slivers: <Widget>[
                _getTopWidget(topSwiperData),
                _createGoodsInfoWidget()
              ],
            )),
      ),
    );
  }

  SliverToBoxAdapter _getTopWidget(List bannerData) {
    return SliverToBoxAdapter(
        child: Container(
      child: Column(
        children: <Widget>[
          //轮播图
          Container(
            height: ScreenUtil.getInstance().setHeight(450),
            child: Swiper(
                itemCount: bannerData.length,
                autoplay: true,
                pagination: SwiperPagination(
                    alignment: Alignment.bottomRight,
                    builder: DotSwiperPaginationBuilder(
                        activeColor: Colors.red,
                        color: Colors.white,
                        activeSize: 5,
                        size: 5)),
                itemBuilder: (context, index) {
                  return CachedNetworkImage(
                      imageUrl: bannerData[index], fit: BoxFit.fill);
                }),
          ),
          //横向滑动的listview
          GridCategoryWidget(),
          //百亿补贴
          SubsidyWidget()
        ],
      ),
    ));
  }

  SliverList _createGoodsInfoWidget() {
    return SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
      Widget widget;

      var goodsItem = _goodsList[index];

      if (goodsItem['type'] != null) {
        widget = HorizontalSlideWidgets(goodsItem);
      } else {
        widget = GoodsItemWidget(
            goodsItem['hd_thumb_url'],
            goodsItem['goods_name'],
            goodsItem['group']['price'],
            goodsItem['cnt'],
            goodsItem['near_group']['list']);
      }

      return widget;
    }, childCount: _goodsList.length));
  }
}
