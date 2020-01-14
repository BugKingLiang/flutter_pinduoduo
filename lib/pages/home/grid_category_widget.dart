import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pingduoduo/pages/home/home_data.dart';
import 'package:pingduoduo/widgets/divider_dart.dart';
import 'package:pingduoduo/widgets/scrool_bar.dart';

class GridCategoryWidget extends StatefulWidget {
  @override
  _GridCategoryWidgetState createState() => _GridCategoryWidgetState();
}

class _GridCategoryWidgetState extends State<GridCategoryWidget> {
  ScrollController _scrollController ;

  //这里有个坑，必须赋初始值
  double _offsetRatio = 0;

  @override
  void initState() {
    _scrollController = new ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() {
      var position = _scrollController.position;

      setState(() {
        _offsetRatio = position.pixels / position.maxScrollExtent;
      });
    });

    return Column(
      children: <Widget>[
        Container(
          color: Colors.white,
            height: ScreenUtil().setHeight(450),
            child: ListView.builder(
              controller: _scrollController,
              physics: BouncingScrollPhysics(),
              itemExtent: ScreenUtil().setWidth(216),
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    Expanded(
                        child: _createItem(HomeData.categoryData[index][0][0],
                            HomeData.categoryData[index][0][1])),
                    Expanded(
                        child: _createItem(HomeData.categoryData[index][1][0],
                            HomeData.categoryData[index][1][1])),
                    // Expanded(child: _createItem(itemData[index+1][0], itemData[index+1][1])),
                  ],
                );
              },
              itemCount: HomeData.categoryData.length,
              scrollDirection: Axis.horizontal,
            )),
        Container(
            child: Center(
                child: CustomPaint(
          painter: ScroolbarWidget(_offsetRatio),
          size: Size(ScreenUtil().setWidth(200), ScreenUtil().setHeight(10)),
        ))),

      DividerWidget(height: 5)
      ],
    );
  }

  Widget _createItem(String img, String titleName) {
    var size = ScreenUtil().setWidth(120);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          child:
              Image.network(img, fit: BoxFit.fill, width: size, height: size),
        ),
        Text(
          titleName,
          style: TextStyle(fontSize: 12),
        )
      ],
    );
  }
}
