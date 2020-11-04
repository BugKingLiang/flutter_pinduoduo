import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pingduoduo/provider/category_provider.dart';
import 'package:pingduoduo/storage/mock_data.dart';
import 'package:provider/provider.dart';

class LeftCategory extends StatefulWidget {
  @override
  _LeftCategoryState createState() => _LeftCategoryState();
}

class _LeftCategoryState extends State<LeftCategory> {

  String _currentSelectKey='推荐';
  Color _selectedIndicatorColor = Color(0xffe02e24);
  Color _normalIndicatorColor = Color(0xfff8f8f8);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
//    _currentSelectKey = Provider.of<CategoryProvider>(context).id;


    return Container(
      width: ScreenUtil().setWidth(250),
      child: ListView(
        itemExtent: ScreenUtil().setHeight(150),
        physics: BouncingScrollPhysics(),
        children: MockData.categoryMap.keys.map((key){
          return GestureDetector(
            onTap: () {
              setState(() {
                _currentSelectKey = key;

              Provider.of<CategoryProvider>(context).onChangeId(MockData.categoryMap[key]);
              });
            },
            child: Container(
              color: _currentSelectKey == key
                  ? Colors.white
                  : Color(0xfffafafa),
              child: Stack(
                alignment: Alignment.topLeft,
                children: <Widget>[
                  Center(
                    child: Text(key,
                        style: TextStyle(
                            color: _currentSelectKey == key
                                ? _selectedIndicatorColor
                                : Color(0xff666666))),
                  ),
                  Positioned(
                      child: Container(
                        width: ScreenUtil().setWidth(10),
                        color: _currentSelectKey == key
                            ? _selectedIndicatorColor
                            : _normalIndicatorColor,
                        margin: EdgeInsets.symmetric(vertical: 10),
                      ))
                ],
              ),
            ),
          );

        }).toList(),
      ),
    );

   /* return Container(
        width: ScreenUtil().setWidth(250),
        child: ListView.builder(
            itemExtent: ScreenUtil().setHeight(150),
            itemCount: MockData.category.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _currentSelectIndex = index;
                    Provider.of<CategoryProvider>(context).onChangeId(index);
                  });
                },
                child: Container(
                  color: _currentSelectIndex == index
                      ? Colors.white
                      : Color(0xfffafafa),
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: <Widget>[
                      Center(
                        child: Text(MockData.category[index],
                            style: TextStyle(
                                color: _currentSelectIndex == index
                                    ? _selectedIndicatorColor
                                    : Color(0xff666666))),
                      ),
                      Positioned(
                          child: Container(
                        width: ScreenUtil().setWidth(10),
                        color: _currentSelectIndex == index
                            ? _selectedIndicatorColor
                            : _normalIndicatorColor,
                        margin: EdgeInsets.symmetric(vertical: 10),
                      ))
                    ],
                  ),
                ),
              );
            }));*/



  }
}
