import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pingduoduo/provider/search_provider.dart';
import 'package:pingduoduo/router/router.dart';
import 'package:pingduoduo/storage/sp_data.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

import '../../Application.dart';

//搜索结果列表
class SearchSuggestListWidget extends StatelessWidget {

  List _searchSuggest;

  TextEditingController _controller;


  SearchSuggestListWidget(this._controller);

  @override
  Widget build(BuildContext context) {

    return Container(

      child: Consumer(builder: (context,SearchProviderModel model,child){
        _searchSuggest = model.searchSuggets;
        return ListView.separated(
            itemBuilder: (context, index) {
              return Listener(
                onPointerDown: (event){


                  SPUtils.instance.addSearchHistory(_searchSuggest[index]);
                  Application.router.navigateTo(context,
                      Routes.search_resout_page+"?key=${Uri.encodeComponent(_searchSuggest[index])}",
                      transition: TransitionType.cupertino);
                  _controller.clear();

                },
                behavior: HitTestBehavior.opaque,

                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 10),
                  height: ScreenUtil.instance.setHeight(80),
                  child: InkWell(child: Text(_searchSuggest[index])),),
              );
            },
            separatorBuilder: (context, index) {
              return Divider(indent: 10);
            }, itemCount:_searchSuggest==null?0: _searchSuggest.length);

      }),

    );



  }

}
