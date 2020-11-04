import 'package:cached_network_image/cached_network_image.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart' hide NestedScrollView;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pingduoduo/Application.dart';
import 'package:pingduoduo/pages/subsidy/countdown_list_widget.dart';
import 'package:pingduoduo/pages/subsidy/subsidy_goods_list_widget.dart';
import 'package:pingduoduo/provider/countdown_provider.dart';
import 'package:pingduoduo/util/image_utls.dart';
import 'package:provider/provider.dart';

//  百亿补贴页面
class SubsidyPage extends StatefulWidget {
  @override
  _SubsidyPageState createState() => _SubsidyPageState();
}

class _SubsidyPageState extends State<SubsidyPage> with TickerProviderStateMixin {

  String _topImage =
      'https://t00img.yangkeduo.com/goods/2020-04-29/0d7996dd770d8631c9b84fd4a996ecb0.png?imageMogr2/sharpen/50%7CimageView2/2/w/768/q/70/format/webp';
  List<String> tabs =['精选','上新','潮鞋','数码','电脑','海淘','小家电','食品','美妆'];

  ScrollController _parentScrollContrller = ScrollController();
  TabController _tabController;

  double pinnedHeaderHeight;

  double _headerHeight = 0;
  double _top = 0;
  double _headerOpacity = 0;
  Color _headerOpacityColor = Colors.white.withOpacity(0);
  Brightness _brightness = Brightness.dark;
  String _headerBackImage;
  String _headerShareImage;
  Color _headerSearchBackroundColor = Colors.white;


  CountDownProvider countdowValue = CountDownProvider();


  @override
  void initState() {
    _headerBackImage = ImageUtils.getSvgImagePath('back_white');
    _headerShareImage = ImageUtils.getImagePath('icons/share_white');

    _tabController = TabController(length: tabs.length, vsync: this);
    _parentScrollContrller.addListener(_onScrollViewListener);
    countdowValue.countdown();
    super.initState();
  }
@override
  void dispose() {
    super.dispose();
    _tabController.dispose();
    _parentScrollContrller.dispose();
    countdowValue.cancelTimer();
  }

  //滚动监听
  void _onScrollViewListener(){
    double offset = _parentScrollContrller.offset;
    setState(() {
      _top = offset;
    });
    if( offset <=50){
      if(offset <=25){
        //切换成白色
        _headerBackImage = ImageUtils.getSvgImagePath('back_white');
        _headerShareImage = ImageUtils.getImagePath('icons/share_white');
        _brightness = Brightness.dark;
        _headerSearchBackroundColor = Colors.white;
      }else {
        //切换成黑色
        _headerBackImage = ImageUtils.getSvgImagePath('back_black');
        _headerShareImage = ImageUtils.getImagePath('icons/share');
        _brightness = Brightness.light;
        _headerSearchBackroundColor = Color(0xfff4f4f4);
      }

      setState(() {

        _headerOpacity = offset/50;
        _headerOpacityColor = Colors.white.withOpacity(_headerOpacity);

      });

    }

  }
  @override
  Widget build(BuildContext context) {

    calculatePinnedHeaderHeight();
    _headerHeight = ScreenUtil().setHeight(1500);


    return ChangeNotifierProvider.value(
      value: countdowValue,
      child: Scaffold(
        body: NestedScrollView(
          controller: _parentScrollContrller,
            headerSliverBuilder: (c, f){
              return <Widget>[
                _createHeaderWidget()
              ];
            },
          pinnedHeaderSliverHeightBuilder: () {
            return pinnedHeaderHeight;
          },
          innerScrollPositionKeyBuilder: () {
            var index = "Tab";
            index += _tabController.index.toString();

            return Key(index);
          },
          body: Column(
            children: <Widget>[
              _createTabBarWidget(),
              Expanded(child: TabBarView(
                controller: _tabController,
                  children: _createBodyWidgets()))
            ],

          ),

        ),

      ),
    );

  }
  //创建头部widget
  SliverAppBar _createHeaderWidget(){
    return SliverAppBar(

      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      pinned: true,
      floating: true,
      expandedHeight: _headerHeight,
      brightness: _brightness,
      titleSpacing: 0,
      title: Container(
        height: kToolbarHeight,
        color: _headerOpacityColor,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 3),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              GestureDetector(
                onTap: (){
                  Application.router.pop(context);
                },
                  child: SvgPicture.asset(_headerBackImage,fit: BoxFit.cover,width: ScreenUtil().setWidth(90),height: ScreenUtil().setWidth(90))),
              Expanded(child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: _headerSearchBackroundColor

                  ),
                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(ImageUtils.getImagePath('main/apj'),width: 20,height: 20,),
                      Text('智能手表',style: TextStyle(fontSize: 14,color: Color(0xff9c9c9c)),)
                    ],
                  ))),
              Image.asset(_headerShareImage,width: ScreenUtil().setWidth(90),height: ScreenUtil().setWidth(90),)

            ],
          ),
        ),
      ),

      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background: Stack(
          children: <Widget>[

            Positioned.fill(child: Column(

              children: <Widget>[
                //倒计时
                Container(
                  height: ScreenUtil().setHeight(900),
                  child: Stack(
                    
                    children: <Widget>[
                      Positioned.fill(child: CachedNetworkImage(imageUrl: _topImage,fit: BoxFit.fill)),
                      Positioned(
                        left:0,right:0,bottom: 5,
                        child: Container(
                          height: ScreenUtil().setHeight(350),
                          color: Colors.transparent,
                          child: CountDownWidget()
                        ),
                      ),
                    ],
                    
                  ),
                ),
                Container(
                  height: ScreenUtil().setHeight(120),
                  width: ScreenUtil().screenWidth,
                  child: CachedNetworkImage(
                    imageUrl:'https://pinduoduoimg.yangkeduo.com/brand_station/2020-03-18/afae4ee9-8417-4af4-a306-a1bb8021ee54.png?imageMogr2/sharpen/50/strip%7CimageView2/2/w/1000/q/70/format/webp',fit: BoxFit.fill,),
                ),
                Expanded(child: Padding(padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
                child: CachedNetworkImage(imageUrl: 'https://t00img.yangkeduo.com/goods/2020-04-29/2e76804974e9a1caebcc22c18dc1e220.png?imageMogr2/sharpen/50/strip%7CimageView2/2/w/686/q/70/format/webp',fit: BoxFit.fill))),
                Expanded(child: Padding(padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
                    child: CachedNetworkImage(imageUrl: 'https://t00img.yangkeduo.com/goods/2020-04-29/a3a7feab6162eccb1612f740ba32d8a9.png?imageMogr2/sharpen/50/strip%7CimageView2/2/w/686/q/70/format/webp',fit: BoxFit.fill)))


              ],
            )),
            //假的状态颜色
            Positioned(
              top: _top,
              child: Container(
                color: _headerOpacityColor,
                height:  MediaQuery.of(context).padding.top,
                width: ScreenUtil().screenWidth,
              ),
            )
          ],
        )
      ),
      bottom: PreferredSize(child: Container(), preferredSize: Size.fromHeight(0)),
    );
  }

  List<Widget> _createBodyWidgets(){

    return tabs.map((value){

      return NestedScrollViewInnerScrollPositionKeyWidget(Key('${value}'), SubsityGoodsListWidget(tabName: value));

    }).toList();



  }




  void calculatePinnedHeaderHeight(){

    final double statusBarHeight = MediaQuery.of(context).padding.top;
    pinnedHeaderHeight =
    //statusBar height
    statusBarHeight +
        //pinned SliverAppBar height in header
        kToolbarHeight;

  }


  Widget _createTabBarWidget(){

    return Container(
      color: Colors.white,
      child: TabBar(
          controller: _tabController,
          labelColor: Colors.redAccent,
          unselectedLabelColor: Colors.black87,
          indicatorColor: Colors.redAccent,
          indicatorSize: TabBarIndicatorSize.label,
          isScrollable: true,
          tabs: tabs.map((value){
            return Tab(text: value);


          }).toList()),
    );


  }



}
