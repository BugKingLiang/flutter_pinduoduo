import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pingduoduo/widgets/flow_tag_widget.dart';
import 'package:pingduoduo/widgets/search_widget.dart';

import 'history_recommend_widget.dart';


class SearchPage extends StatelessWidget {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SearchWidget( '1千亿补贴',searchType: SearchType.SEARCH_RESULT_TYPE,),

            HistoryRecommendWidget()

          ],
        ),
      ),
    );
  }


  void onItemClick(){
  print('dddddd');


  }
}
