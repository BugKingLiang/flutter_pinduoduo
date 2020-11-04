
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pingduoduo/bean/flow_tag_bean.dart';
import 'package:pingduoduo/pages/search/search_suggest_list.dart';
import 'package:pingduoduo/provider/search_provider.dart';
import 'package:pingduoduo/storage/http/api.dart';
import 'package:pingduoduo/storage/mock_data.dart';
import 'package:pingduoduo/storage/sp_data.dart';
import 'package:pingduoduo/widgets/search_widget.dart';
import 'package:provider/provider.dart';

import 'history_recommend_widget.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  SearchProviderModel spm;

  var historyData;
  TextEditingController _controller = TextEditingController();
//  bool showHistoryPage ;


  @override
  void initState() {
    super.initState();
    historyData = Map<FlowTagBean,List<FlowTagBean>>();
    historyData[MockData.search_history_key] = <FlowTagBean>[];

    spm = SearchProviderModel.init(MockData.findData, MockData.recommendData,historyData);
//    showHistoryPage =spm.showHistoryPage;

    //测试数据
    /*SPUtils.instance
    ..putSearchHistory('哦哦哦')
    ..putSearchHistory('ddddd')
    ..putSearchHistory('逻辑');*/

    SPUtils.instance.getSearchHistory().then((result){
      var historys =   result.map((v){
        return FlowTagBean(v, supportLongClick: true);
      }).toList();
      spm.addListHistoryData(historys);

    });

    _controller.addListener(onEditeChangeListener);


  }
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
              elevation: 0,
              brightness: Brightness.light,
              backgroundColor: Colors.white),
          preferredSize: Size.fromHeight(0)),
      body: ChangeNotifierProvider.value(
        value: spm,
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SearchWidget(
                '1千亿补贴',
                searchType: SearchType.SEARCH_TYPE,controller: _controller,
              ),

              Expanded(
                  child: Stack(
                    children: <Widget>[

                      Offstage(
                        child: HistoryRecommendWidget(),
                        offstage: !spm.showHistoryPage,
                      ),
                      Offstage(
                        offstage: spm.showHistoryPage,
                        child: SearchSuggestListWidget(_controller),
                      )

                    ],
                  )
              )
            ],
          ),
        ),
      ),
    );
  }


  void onEditeChangeListener() {
    String inputText = _controller.text;
    setState(() {
      if(inputText.isEmpty){
        spm.clearSearchSuggets();
      }
      spm.showHistoryPage = inputText.isEmpty;
    });



    if (inputText.isNotEmpty) {

      Api.instance.searchSuggest(inputText).then((response) {

        spm.searchSuggets = response.data['suggest'];
      });
    }
  }





}
