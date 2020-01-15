import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pingduoduo/pages/home/other_page.dart';
import 'package:pingduoduo/pages/home/popular_page.dart';
import 'package:pingduoduo/util/color_constant.dart';
import 'package:pingduoduo/widgets/search_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  String _currentTitle;
  List<String> _topTabBarTitle;
  TabController _tabController;

  @override
  void initState() {
    super.initState();



    _topTabBarTitle = [
      '热门',
      '男装',
      '手机',
      '电器',
      '汽车',
      '百货',
      '电脑',
      '鞋包',
      '食品',
      '女装',
      '家具',
      '内衣',
      '家具',
      '内衣',
      '家具',
      '运动',
      '水果',
      '母婴',
      '家纺',
      '医药'
    ];
    _currentTitle = _topTabBarTitle[_currentIndex];

    _tabController = TabController(
        initialIndex: _currentIndex,
        length: _topTabBarTitle.length,
        vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.getInstance()..init(context);
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
            elevation: 0,
            brightness: Brightness.dark,
            backgroundColor: ColorConstant.primaryColor,
          ),
          preferredSize: Size.fromHeight(0)),
      body: Column(
        children: <Widget>[
        SearchWidget('1千亿补贴',bgColor: ColorConstant.primaryColor),
          Container(
              color: Colors.white,
              child: TabBar(
                  onTap: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  controller: _tabController,
                  isScrollable: true,
                  indicatorColor: ColorConstant.primaryColor,
                  labelColor: ColorConstant.primaryColor,
                  labelPadding: EdgeInsets.only(left: 5, right: 5),
                  unselectedLabelColor: Colors.black54,
                  labelStyle: TextStyle(fontSize: 14),
                  tabs: _topTabBarTitle.map((value) {
                    return Tab(
                      text: value,
                    );
                  }).toList())),
          Expanded(
              child: TabBarView(
                  controller: _tabController,
                  children: _topTabBarTitle.asMap().keys.map((index) {
//                    var topTabBarTitle = _topTabBarTitle[index];
                    return index == 0 ?  PopularPage():OtherPage();
                  }).toList()))
        ],
      ),
    );
  }
}
