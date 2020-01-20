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
            preferredSize: Size.fromHeight(0),
        ),

      body: Container(

        child: CustomScrollView(
          slivers: <Widget>[

            SliverAppBar(
              floating: true,
              backgroundColor:Colors.white,
              flexibleSpace:  Container(child: SearchWidget('kkkk',searchType: SearchType.SEARCH_RESULT_TYPE)),
            ),
            SliverPersistentHeader(delegate: HeaderWidget(ScreenUtil.getInstance().setHeight(120)),pinned: true,),
           SliverList(delegate: SliverChildBuilderDelegate((context,index){
             return Container(height: 100,child: Text('$index ====='));

           },childCount: 30))

          ],
        ),

      ),

    );
  }




}


class HeaderWidget extends  SliverPersistentHeaderDelegate {

  double childHeight;


  HeaderWidget(this.childHeight);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {

    return Container(
      color: Colors.red,

    );
  }

  @override
  double get maxExtent => childHeight;

  @override
  double get minExtent => childHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return this !=oldDelegate;
  }




}
