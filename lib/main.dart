import 'dart:io';

import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pingduoduo/Application.dart';
import 'package:pingduoduo/pages/category/category.dart';
import 'package:pingduoduo/pages/goods_detail/goods_detail_page.dart';
import 'package:pingduoduo/pages/home/home.dart';
import 'package:pingduoduo/pages/member/member.dart';
import 'package:pingduoduo/pages/message/msessage.dart';
import 'package:pingduoduo/pages/recommend/recommend.dart';
import 'package:pingduoduo/router/router.dart';
import 'package:pingduoduo/util/color_constant.dart';
import 'package:pingduoduo/util/image_utls.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

void main() {
  runApp(MyApp());
  if (Platform.isAndroid) {
    var systemUiOverlayStyle = SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage() {
    Router router = Router();
    Routes.configureRouter(router);
    Application.router = router;
  }

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController _pageController = PageController();
  int _currentIndex = 0;
  var titleNames = ['首页', '推荐', '分类', '聊天', '个人中心'];

  final TextStyle _tabTextStyleNormalColor =
      TextStyle(color: Color(0xff999999));
  final TextStyle _tabTextSytleSelectColor =
      TextStyle(color: ColorConstant.bottomTitleColor);

  var _tabImages;
  List<Widget> _bodyPgges;

  @override
  void initState() {
    super.initState();

    _tabImages = <List<Image>>[
      [
        _createTabImage('main/apm'),
        _createTabImage('main/apl'),
      ],
      [
        _createTabImage('main/apq'),
        _createTabImage('main/app'),
      ],
      [
        _createTabImage('main/category_checked'),
        _createTabImage('main/category'),
      ],
      [
        _createTabImage('main/api'),
        _createTabImage('main/aph'),
      ],
      [
        _createTabImage('main/apo'),
        _createTabImage('main/apn'),
      ],
    ];

    _bodyPgges = [
      HomePage(),
      RecommendPage(),
      CagegoryPage(),
      MessagePage(),
      MemberPage()
    ];
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.getInstance()..init(context);
    return RefreshConfiguration(
      headerBuilder: () => MaterialClassicHeader(),
      enableBallisticLoad: true,
      child: _mainMaterialApp(),
    );
  }

  MaterialApp _testMaterailApp(){
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: GoodsDetailPage()
        ));
  }

  MaterialApp _mainMaterialApp(){

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Application.router.generator,
        home: Scaffold(
          bottomNavigationBar: CupertinoTabBar(
              currentIndex: this._currentIndex,
              onTap: (index) {
                _pageController.jumpToPage(index);
                setState(() {
                  this._currentIndex = index;
                });
              },
              items: _createTabBarItem()),
          body: PageView.builder(
            itemBuilder: (context, index) {
              return _bodyPgges[index];
            },
            physics: NeverScrollableScrollPhysics(),
            controller: _pageController,
          ),
        ));

  }

  List<BottomNavigationBarItem> _createTabBarItem() {
    List<BottomNavigationBarItem> tabBarItems = List();
    for (int i = 0; i < titleNames.length; i++) {
      tabBarItems.add(BottomNavigationBarItem(
          icon: _getTabImageByIndex(i), title: _getTabTitleByIndex(i)));
    }

    return tabBarItems;
  }

  Image _createTabImage(String imgPath) {
    return Image.asset(
      ImageUtils.getImagePath(imgPath),
      width: 20,
      height: 20,
    );
  }

  Image _getTabImageByIndex(int index) {
    if (_currentIndex == index) {
      return _tabImages[index][0];
    }

    return _tabImages[index][1];
  }

  TextStyle _getTabTextStyle(int index) {
    if (_currentIndex == index) {
      return _tabTextSytleSelectColor;
    }
    return _tabTextStyleNormalColor;
  }

  Text _getTabTitleByIndex(int index) {
    return Text(titleNames[index], style: _getTabTextStyle(index));
  }
}
