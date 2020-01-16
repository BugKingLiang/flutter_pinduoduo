import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pingduoduo/bean/flow_tag_bean.dart';
import 'package:pingduoduo/provider/search_provider.dart';
import 'package:pingduoduo/util/image_utls.dart';
import 'package:pingduoduo/widgets/search_widget.dart';
import 'package:provider/provider.dart';

import 'history_recommend_widget.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  SearchProviderModel spm;

  List<Map<FlowTagBean, List<FlowTagBean>>> data;

  @override
  void initState() {
    super.initState();
    data = [
      {
        FlowTagBean('更多搜索方式',
            leftIcon: 'light', imageType: ImageType.LOCAL_SVG): [
          FlowTagBean('搜索店铺', leftIcon: 'store', imageType: ImageType.LOCAL_SVG,supportLongClick: true)
        ]
      },
      {
        FlowTagBean('搜索发现', leftIcon: 'find', imageType: ImageType.LOCAL_SVG): [
          FlowTagBean('净水器直饮机'),
          FlowTagBean('皮套女'),
          FlowTagBean('快充数据线'),
          FlowTagBean('傅雷家书人教版'),
          FlowTagBean('净水器直饮机'),
          FlowTagBean('智能感应飞行器'),
          FlowTagBean('下半身裙子冬季'),
          FlowTagBean('劲霸男装'),
          FlowTagBean('无缝丝袜')
        ],
      },
    ];
    spm = SearchProviderModel(data);
  }

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
      body: ChangeNotifierProvider.value(
        value: spm,
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SearchWidget(
                '1千亿补贴',
                searchType: SearchType.SEARCH_RESULT_TYPE,
              ),
              Expanded(
                  child: HistoryRecommendWidget())
            ],
          ),
        ),
      ),
    );
  }
}
