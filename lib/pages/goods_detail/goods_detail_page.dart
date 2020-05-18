import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:pingduoduo/pages/goods_detail/config_widget.dart';
import 'package:pingduoduo/pages/goods_detail/title_price_widget.dart';
import 'package:pingduoduo/util/image_utls.dart';
import 'package:pingduoduo/widgets/image_text_widget.dart';
import 'package:pingduoduo/widgets/triangle_shape.dart';

//商品详情
class GoodsDetailPage extends StatefulWidget {
  @override
  _GoodsDetailPageState createState() => _GoodsDetailPageState();
}

class _GoodsDetailPageState extends State<GoodsDetailPage> {
  double _statusBarHeight;
  double _toolbarHeight;
  List<String> swiperData;

  @override
  void initState() {

    swiperData = [
      'https://t00img.yangkeduo.com/goods/images/2020-04-29/acdbfd36-caad-4831-8325-acd125f185a6.jpg',
      'https://t00img.yangkeduo.com/goods/images/2020-02-24/c23a3fa9-b3e7-4cf1-8bc6-a6f8b35e9a8b.jpg',
      'https://t00img.yangkeduo.com/goods/images/2020-02-24/444d353a-07ab-400c-8130-e5a9c13de4e3.jpg',
      'https://t00img.yangkeduo.com/goods/images/2020-02-24/53ed839c-75eb-413d-a9e9-c44d18e59827.jpg',
      'https://t00img.yangkeduo.com/goods/images/2020-02-24/5c32f8c8-0179-46b5-88e8-c3073b26ff02.jpg',
      'https://t00img.yangkeduo.com/goods/images/2020-02-24/77e48ba4-131e-4bdd-96f7-5dce906b2576.jpg'
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _statusBarHeight = MediaQuery.of(context).padding.top;
    _toolbarHeight = ScreenUtil.getInstance().setHeight(100);

    return MaterialApp(

      home: Scaffold(
        body: Container(
          height: ScreenUtil.screenHeight,
          child: Stack(
            children: <Widget>[

              Positioned.fill(
                  child: CustomScrollView(
                    slivers: <Widget>[
                      _createSwiperWidget(),
                      SliverToBoxAdapter(
                        child: TitlePriceWidget(),
                      ),
                      SliverToBoxAdapter(child: GoodsConfigWidget(),)

                    ],
                  )),
              //标题头
              Positioned(
                left: 0,right: 0,
                  child: _createToolBarWidget()),
              //底部购买
              Positioned(
                  left: 0, right: 0, bottom: 0,
                  child: _createBottomWidget())
            ],
          ),
        ),


      ),
    );
  }

  Widget _createToolBarWidget(){

    return Container(
      color: Colors.white.withOpacity(0.1),
      height: _statusBarHeight+_toolbarHeight,
      padding:  EdgeInsets.only(top: _statusBarHeight),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(ImageUtils.getSvgImagePath('back_black'),width: _toolbarHeight,),
          ),
          Expanded(child: Offstage(child: Container(),offstage: true,)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(ImageUtils.getImagePath('icons/share'),),
          )
        ],
      ),


    );


  }



  SliverToBoxAdapter _createSwiperWidget() {
    return SliverToBoxAdapter(
      child: Container(
        height: ScreenUtil.getInstance().setHeight(1000),
        child: Swiper(
            itemCount: swiperData.length,
            autoplay: false,
            itemBuilder: (context, index) {
              return CachedNetworkImage(
                imageUrl: swiperData[index],
                fit: BoxFit.fill,);
            }),
      ),
    );
  }


  Widget _createBottomWidget() {
    return Container(color: Colors.white,
      height: ScreenUtil.getInstance().setHeight(160),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ImagetTextWidget('店铺', 'icons/store', filePath: true,
              imageSize: ScreenUtil.getInstance().setWidth(70),),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: ImagetTextWidget('收藏', 'icons/like', filePath: true,
              imageSize: ScreenUtil.getInstance().setWidth(70),),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 20),
            child: ImagetTextWidget('客服', 'icons/message', filePath: true,
              imageSize: ScreenUtil.getInstance().setWidth(70),),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Color(0xfff3aba7),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('¥5500',
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                  Text('单独购买',
                      style: TextStyle(color: Colors.white, fontSize: 18))
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Color(0xffe02e24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('¥5068',
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                  Text('发起拼单',
                      style: TextStyle(color: Colors.white, fontSize: 18))
                ],
              ),
            ),
          )


        ],),);
  }


}
