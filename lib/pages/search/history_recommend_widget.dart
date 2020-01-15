import 'package:flutter/material.dart';
import 'package:pingduoduo/bean/flow_tag_bean.dart';
import 'package:pingduoduo/widgets/flow_tag_widget.dart';

//包含历史记录,搜索发现的页面
class HistoryRecommendWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container(
      height: 400,
      child: CustomScrollView(
        slivers: <Widget>[
//          _createWrapWidget()
        ],
      ),

    );
  }


  Widget _crateHeaderWidget(){
    return Container(
      child: Row(
        children: <Widget>[

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.history),
          ),
          Expanded(child: Text('kkkkk',style: TextStyle(color: Color(0xff9c9c9c),fontSize: 18),)),

          Offstage(
            offstage: false,
              child: Icon(Icons.delete))

        ],
      ),
    );
  }

  Widget _createWrapWidget(List<FlowTagBean> flowTabBean){

    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          _crateHeaderWidget(),
          Wrap(
          spacing:4,

            runSpacing: 2,

            runAlignment: WrapAlignment.start,
            children: <Widget>[
              FlowTagWidget(null),
              FlowTagWidget(null),
              FlowTagWidget(null),
              FlowTagWidget(null),
              FlowTagWidget(null),
            ],
          )
        ],
      ),
    );

  }


}
