import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pingduoduo/http/api.dart';
import 'package:pingduoduo/util/color_constant.dart';
import 'package:pingduoduo/widgets/goods_info_widget.dart';
import 'package:pingduoduo/widgets/quick_back_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RecommendPage extends StatefulWidget {
  @override
  _RecommendPageState createState() => _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage> with AutomaticKeepAliveClientMixin{
  int _page = 0; //倍数递增

  List _data = List();
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  bool _showToTopBtn =false;
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener((){
      if(_scrollController.offset <1000 && _showToTopBtn){
        setState(() {
          _showToTopBtn =false;
        });
      }else if(_scrollController.offset >= 1000 && _showToTopBtn == false){
        setState(() {
          _showToTopBtn = true;
        });
      }
    });

    _loadMoreData();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.getInstance()..init(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('推荐', style: TextStyle(fontSize: 18)),
        brightness: Brightness.dark,
        backgroundColor: ColorConstant.primaryColor,
      ),
      body: body(),
    );
  }

  Widget body() {
    return Scaffold(
        floatingActionButton: !_showToTopBtn?null:QuickBackWidget(_scrollController),
        body: Container(
            child: SmartRefresher(
          controller: _refreshController,
          enablePullUp: true,
          onLoading: _loadMoreData,
          child: Container(
            child: GridView.builder(
                itemCount: _data.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 2,
                    childAspectRatio: 0.7),
                itemBuilder: (context, index) {
                  var item = _data[index];
                  var iconList = item['icon_list'];
                  return GoodsInfoWidget(
                      item['hd_thumb_url'],
                      //切记不要直接使用ScreenUtil.getInstance().width/2
                      ScreenUtil.getInstance()
                          .setWidth(ScreenUtil.getInstance().width / 2),
                      iconList != null ? iconList[0]['url'] : null,
                      item['goods_name'],
                      item['tag_list'],
                      item['min_on_sale_group_price'],
                      item['sales_tip'],
                      null,
                      lrWidget: LowerRightWidget.find);
                }),
          ),
        )));
  }

  void _loadMoreData() {
    Api.instance.requestRcommendData(_page + 20).then((response) {
      if (response.data != null && response.data['data'] != null) {
        _page += 20;

        setState(() {
          _data.addAll(response.data['data'] as List);
        });
      }
    });
  }

  @override
  bool get wantKeepAlive => true;
}
