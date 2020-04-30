import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pingduoduo/bean/image_text_bean.dart';
import 'package:pingduoduo/storage/http/api.dart';
import 'package:pingduoduo/util/image_utls.dart';
import 'package:pingduoduo/widgets/divider_dart.dart';
import 'package:pingduoduo/widgets/goods_info_widget.dart';
import 'package:pingduoduo/widgets/image_text_widget.dart';

class MemberPage extends StatefulWidget {
  @override
  _MemberPageState createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  final List<String> orderNames = ['待付款', '待分享', '待发货', '待收货', '待评价'];
  final List<String> orderImages = [
    'icons/unpayed',
    'icons/unshare',
    'icons/confirmed',
    'icons/shipping',
    'icons/unrated'
  ];

  final List<String> middleMenuNames = ['优惠券', '商品收藏', '店铺关注', '历史浏览', '退款售后'];
  final List<String> middleMenuImages = [
    'icons/amc',
    'icons/goods_collection',
    'icons/mall_collection',
    'icons/history',
    'icons/after_sales'
  ];
  List<ImagetTextBean> bottomMenuBeans;
  List recommendData = List();//推荐商品数据
  int _offset = 0;

  @override
  void initState() {
    super.initState();

    bottomMenuBeans = [
      ImagetTextBean('icons/hongbao2', '新人红包'),
      ImagetTextBean('icons/guoyuan', '多多果园'),
      ImagetTextBean('icons/kanjia', '砍价免费拿'),
      ImagetTextBean('icons/xianjin', '天天领现金'),
      ImagetTextBean('icons/aixiaochu', '多多爱消除'),
      ImagetTextBean('icons/muchang', '多多牧场'),
      ImagetTextBean('icons/huochepiao', '火车票'),
      ImagetTextBean('icons/icon_my_address_v3', '收货地址'),
      ImagetTextBean('icons/icon_my_comments', '我的评价'),
      ImagetTextBean('icons/icon_customer_service', '官方客服'),
      ImagetTextBean('icons/icon_setting', '设置')
    ];

    Api.instance.requestPersonRecommendData(_offset).then((response){
      setState(() {
        recommendData.addAll(response.data['data']);
      });

    });


  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.getInstance()..init(context);

    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
            elevation: 0,
            brightness: Brightness.light,
            backgroundColor: Colors.white,
          ),
          preferredSize: Size.fromHeight(0)),
      body: Container(
        color: Colors.white,
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: <Widget>[
            _createMemberHeaderWidget(),
            _createOrderWidget(),
            _crateMiddleMenuWidget(),
            _createBottomMemuWidget(),
            _createRecommendListWidget()
          ],
        ),
      ),
    );
  }

  Widget _createMemberHeaderWidget() {
    return SliverToBoxAdapter(
      child: Container(
        height: ScreenUtil.getInstance().setHeight(450),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Row(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: CircleAvatar(
                          radius: ScreenUtil.getInstance().setWidth(100),
                          backgroundColor: Colors.white,
                          backgroundImage: CachedNetworkImageProvider(
                              'https://pinduoduoimg.yangkeduo.com/avatar/default/9.png?imageMogr2/format/webp/quality/50'))),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text('180***1234'),
                          Icon(Icons.phone_android)
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Text('徽章墙 > '),
                      )
                    ],
                  )),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    width: ScreenUtil.getInstance().setWidth(300),
                    height: ScreenUtil.getInstance().setHeight(100),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(
                            ScreenUtil.getInstance().setHeight(50))),
                        border: Border.all(width: 1, color: Colors.black12)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Image.asset(ImageUtils.getImagePath('icons/hongbao'),
                            fit: BoxFit.cover,
                            width: ScreenUtil.getInstance().setHeight(50),
                            height: ScreenUtil.getInstance().setHeight(60)),
                        Text('拼单返现'),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),

                decoration: BoxDecoration(
                    color: Color(0xfffdefee),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8))),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            '省钱月卡|帮你省194元',
                            style: TextStyle(color: Color(0xffe02e24)),
                          )),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      alignment: Alignment.center,
                      height: ScreenUtil.getInstance().setHeight(90),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(
                            ScreenUtil.getInstance().setHeight(50))),
                      ),
                      child: Text(
                        '领4张5元无门槛',
                        style: TextStyle(color: Color(0xffe02e24), fontSize: 12),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      child: Image.asset(ImageUtils.getImagePath('icons/more'),
                          width: ScreenUtil.getInstance().setWidth(50)),
                    )
                  ],
                ),
//            child: ,
              ),
              flex: 2,
            )
          ],
        ),
      ),
    );
  }

  Widget _createOrderWidget() {
    return SliverToBoxAdapter(
      child: Container(
        height: ScreenUtil.getInstance().setHeight(400),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('我的订单', style: TextStyle(fontSize: 18)),
                    Text('查看全部 >', style: TextStyle(color: Color(0xff999999)))
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.center,
                  child: GridView.builder(
                      itemCount: orderNames.length,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5),
                      itemBuilder: (context, index) {
                        return ImagetTextWidget(
                          orderNames[index],
                          orderImages[index],
                          filePath: true,
                          imageSize: ScreenUtil.getInstance().setWidth(70),
                          textColor: Color(0xff58595b),
                        );
                      }),
                )),
            DividerWidget(height: ScreenUtil.getInstance().setHeight(20))
          ],
        ),
      ),
    );
  }

  Widget _crateMiddleMenuWidget() {
    return SliverToBoxAdapter(
      child: Container(
        height: ScreenUtil.getInstance().setHeight(300),
        child: Column(
          children: <Widget>[
            Expanded(
              child: GridView.builder(
                  itemCount: middleMenuNames.length,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5, childAspectRatio: 0.8),
                  itemBuilder: (context, index) {
                    return ImagetTextWidget(
                      middleMenuNames[index],
                      middleMenuImages[index],
                      filePath: true,
                      imageSize: ScreenUtil.getInstance().setWidth(70),
                      textColor: Color(0xff58595b),
                    );
                  }),
            ),
            DividerWidget(height: ScreenUtil.getInstance().setHeight(20))
          ],
        ),
      ),
    );
  }
  
  Widget _createBottomMemuWidget() {
    return SliverToBoxAdapter(
      child: Container(
          height: ScreenUtil.getInstance().setHeight(980),
          child: Column(
            children: <Widget>[
              Expanded(
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5
                  ), itemBuilder: (context, index) {
                  ImagetTextBean bean = bottomMenuBeans[index];

                  return ImagetTextWidget(
                    bean.title, bean.image, filePath: true,
                    textColor: Color(0xff58595b),
                    titleSize: 12,
                    imageSize: ScreenUtil.getInstance().setWidth(90),);
                }, itemCount: bottomMenuBeans.length,),
              ),
              DividerWidget(height: ScreenUtil.getInstance().setHeight(20)),
              Container(
                height: ScreenUtil.getInstance().setHeight(200),
                child: CachedNetworkImage(imageUrl: 'http://t00img.yangkeduo.com/goods/2020-01-08/384da760aa4cc2f794b79e3f472c6abf.jpeg',fit: BoxFit.fill),),
              DividerWidget(height: ScreenUtil.getInstance().setHeight(20)),
              Container(height: ScreenUtil.getInstance().setHeight(60),child: Center(child: Text('精选推荐',style: TextStyle(color: Color(0xffe02e24),fontSize: 18))))

            ],
          )
      ),
    );
  }


  Widget _createRecommendListWidget() {
    return SliverGrid(
        delegate: SliverChildBuilderDelegate(
                (context, index) {
                  var item = recommendData[index];
                  var iconList = item['icon_list'];
                  return GoodsInfoWidget(
                      item['hd_thumb_url'],
                      //切记不要直接使用ScreenUtil.getInstance().width/2
                     ScreenUtil.screenWidth / 2,
                  iconList != null ? iconList[0]['url'] : null,
                  item['goods_name'],
                  item['tag_list'],
                  item['min_on_sale_group_price'],

                      item['sales_tip'],
                      null,
                      /*item['near_group']['list'],*/
                  lrWidget: LowerRightWidget.none);

            }, childCount: recommendData.length
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
            crossAxisSpacing: 2,
            childAspectRatio: 0.7));
  }
  
}
