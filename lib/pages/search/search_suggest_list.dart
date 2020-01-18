import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pingduoduo/provider/search_provider.dart';
import 'package:provider/provider.dart';

//搜索结果列表
class SearchSuggestListWidget extends StatelessWidget {

  List _searchSuggest;


  @override
  Widget build(BuildContext context) {

    return Container(

      child: Consumer(builder: (context,SearchProviderModel model,child){
        _searchSuggest = model.searchSuggets;
        return ListView.separated(
            itemBuilder: (context, index) {
              return Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 10),
                height: ScreenUtil.instance.setHeight(80),
                child: InkWell(child: Text(_searchSuggest[index])),);
            },
            separatorBuilder: (context, index) {
              return Divider(indent: 10);
            }, itemCount:_searchSuggest==null?0: _searchSuggest.length);

      }),

    );



  }

}
