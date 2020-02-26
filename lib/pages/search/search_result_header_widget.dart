import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pingduoduo/storage/mock_data.dart';

//搜索结果的头部控件
class SearchResultHeaderWidget extends StatelessWidget {

  List data = MockData.resultHeaderData;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: ScreenUtil.getInstance().setHeight(400),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: ScreenUtil.getInstance().setHeight(60),
              child: Center(child: Text('- 热门品牌 -',style: TextStyle(fontSize: 14),))),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, childAspectRatio: 1.7),
            itemBuilder: (context, index) {
              return CachedNetworkImage(
                  imageUrl: data[index],fit: BoxFit.contain);
            },
            itemCount: data.length,
          )
        ],
      ),
    );
  }
}
