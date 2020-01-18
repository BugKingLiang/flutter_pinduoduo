import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pingduoduo/widgets/search_widget.dart';

//搜索结果页

class SearchResoutPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    ScreenUtil.getInstance().init(context);


    return Scaffold(
        appBar: PreferredSize(
            child: AppBar(
                elevation: 0,
                brightness: Brightness.light,
                backgroundColor: Colors.white),
            preferredSize: Size.fromHeight(0)),

      body: Container(

        child: CustomScrollView(
          slivers: <Widget>[

            SliverPersistentHeader(delegate: HeaderWidget(),floating: true,pinned: true,),
            SliverFillRemaining(
              child: Center(child: Text('FillRemaining', style: TextStyle(fontSize: 30.0))),
            )

          ],
        ),

      ),

    );
  }




}


class HeaderWidget extends  SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          SearchWidget('kkkk',searchType: SearchType.SEARCH_RESULT_TYPE,)

        ],
      ),

    );
  }

  @override
  double get maxExtent => 300;

  @override
  double get minExtent => 100;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }




}
