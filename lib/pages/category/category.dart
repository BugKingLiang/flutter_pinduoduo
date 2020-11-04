import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pingduoduo/pages/category/right_category.dart';
import 'package:pingduoduo/provider/category_provider.dart';
import 'package:pingduoduo/util/image_utls.dart';
import 'package:pingduoduo/widgets/divider_dart.dart';
import 'package:pingduoduo/widgets/search_widget.dart';
import 'package:provider/provider.dart';

import 'left_category.dart';

class CagegoryPage extends StatefulWidget {
  @override
  _CagegoryPageState createState() => _CagegoryPageState();
}

class _CagegoryPageState extends State<CagegoryPage> with AutomaticKeepAliveClientMixin {
  var model = CategoryProvider();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return ChangeNotifierProvider.value(
      value: model,
      child: Scaffold(
        appBar: PreferredSize(
          child: AppBar(
            centerTitle: true,
            elevation: 0,
            brightness: Brightness.light,
            backgroundColor: Colors.white,
          ),
          preferredSize: Size.fromHeight(0),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                  color: Colors.white,
                  height: ScreenUtil().setHeight(100),
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Center(
                          child: Text(
                        '分类',
                        style: TextStyle(fontSize: 18),
                      )),
                      Positioned(
                        child: Image.asset(
                          ImageUtils.getImagePath('icons/share'),
                          width: ScreenUtil().setWidth(80),
                          height: ScreenUtil().setWidth(80),
                        ),
                        right: 10,
                      )
                    ],
                  )),
              SearchWidget('1千亿补贴'),
              DividerWidget(),
              Expanded(
                  child: Row(
                children: <Widget>[
                  LeftCategory(),
                  Expanded(
                      child: Container(
                    color: Colors.white,
                    child: RightCategoryWidget(),
                  ))
                ],
              ))
            ],
          ),

        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
