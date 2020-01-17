import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pingduoduo/storage/sp_data.dart';

//搜索结果列表
class SearchAlternativeListWidget extends StatelessWidget {

  List<String> result = ['1','1','1','1','1','1','1','1','1','1','1','1','1'];


  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
          itemBuilder: (context, index) {
            return Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 10),
              height: ScreenUtil.instance.setHeight(80),
              child: InkWell(child: Text(result[index])),);
          },
          separatorBuilder: (context, index) {
            return Divider(indent: 10);
          }, itemCount: result.length),
    );
  }

}
