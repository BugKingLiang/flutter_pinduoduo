import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pingduoduo/widgets/filter_widget.dart';
import 'package:pingduoduo/widgets/search_widget.dart';

//搜索结果页

class SearchResoutPage extends StatefulWidget {
  @override
  _SearchResoutPageState createState() => _SearchResoutPageState();
}

class _SearchResoutPageState extends State<SearchResoutPage> {

  OverlayEntry _filterPopup;
  GlobalKey _globalKey = GlobalKey();

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

      body: WillPopScope(
        onWillPop: (){
          if(_filterPopup != null){
            _filterPopup.remove();
            return Future.value(false);
          }else{

            return Future.value(true);
          }

        },
        child: Container(

          child: CustomScrollView(
            slivers: <Widget>[

              SliverAppBar(
                floating: true,
                backgroundColor: Colors.white,
                flexibleSpace: Container(child: SearchWidget(
                    'kkkk', searchType: SearchType.SEARCH_RESULT_TYPE)),
              ),
              SliverPersistentHeader(
                delegate: HeaderWidget(_globalKey,ScreenUtil.getInstance().setHeight(120),(){

                  RenderBox ro = _globalKey.currentContext.findRenderObject();
                  Offset offset = ro.localToGlobal(Offset.zero);
                  Size size = ro.size;

                  _createFilterPopupWidget(offset.dy+size.height);
                }),
                pinned: true,),
              SliverList(delegate: SliverChildBuilderDelegate((context, index) {
                return Container(height: 100, child: Text('$index ====='));
              }, childCount: 30))

            ],
          ),

        ),
      ),

    );
  }

  void _createFilterPopupWidget(double top) {
    _filterPopup = OverlayEntry(builder: (context) {
      return Positioned(
          top: top,
          width: ScreenUtil.screenWidth,
          height: ScreenUtil.getInstance().setHeight(ScreenUtil.screenHeight-top),
          child: FilterWidget(ScreenUtil.instance.setHeight(800),_filterPopup)
      );
    });
    Overlay.of(context).insert(_filterPopup);
  }
}


class HeaderWidget extends SliverPersistentHeaderDelegate {

  double childHeight;

  VoidCallback topCallback;
  Key filterKey;


  HeaderWidget(this.filterKey,this.childHeight,this.topCallback );

  @override
  Widget build(BuildContext context, double shrinkOffset,
      bool overlapsContent) {
    return Container(
      key: filterKey,
      color: Colors.red,
      child: GestureDetector(
        onTap: () {

          topCallback();
        },
      ),

    );
  }

  @override
  double get maxExtent => childHeight;

  @override
  double get minExtent => childHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return this != oldDelegate;
  }


}


