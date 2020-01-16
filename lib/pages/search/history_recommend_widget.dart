import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pingduoduo/bean/flow_tag_bean.dart';
import 'package:pingduoduo/provider/search_provider.dart';
import 'package:pingduoduo/util/image_utls.dart';
import 'package:pingduoduo/widgets/flow_tag_widget.dart';
import 'package:provider/provider.dart';

//包含历史记录,搜索发现的页面

class HistoryRecommendWidget extends StatefulWidget {
  @override
  _HistoryRecommendWidgetState createState() => _HistoryRecommendWidgetState();
}

class _HistoryRecommendWidgetState extends State<HistoryRecommendWidget> {

  var data;

  @override
  Widget build(BuildContext context) {
    data = Provider.of<SearchProviderModel>(context).data;


    return Container(
        padding: EdgeInsets.only(left: 10, right: 10, top: 5),
        child: ListView.separated(
            itemBuilder: (context, index) {
              var itemData = data[index];
              var key = itemData.keys.toList()[0];
              return _createWrapWidget(index, key, itemData[key]);
            },
            separatorBuilder: (context, index) {
              return Divider(
                  color: Colors.white,
                  height: ScreenUtil.getInstance().setHeight(40));
            },
            itemCount: data != null ? data.length : 0));
  }

  Widget _crateHeaderWidget(FlowTagBean headerData) {
    return Container(
      height: ScreenUtil.getInstance().setHeight(120),
      child: Row(
        children: <Widget>[
          Offstage(
            offstage: headerData.leftIcon == null,
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                  width: 15,
                  height: 15,
                  child: ImageUtils.getImageWidget(
                      headerData.leftIcon, headerData.imageType)),
            ),
          ),
          Expanded(
              child: Text(
                headerData.content,
                style: TextStyle(color: Color(0xff9c9c9c), fontSize: 16),
              )),
          Offstage(
              offstage: headerData.rightIcon == null,
              child: Container(
                  width: 20,
                  height: 20,
                  child: ImageUtils.getImageWidget(
                      headerData.rightIcon, headerData.imageType)))
        ],
      ),
    );
  }

  Widget _createWrapWidget(
      int headerIndex, FlowTagBean headerData, List<FlowTagBean> flowTagBean) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _crateHeaderWidget(headerData),
        Wrap(
          spacing: 4,
          runSpacing: 2,
          runAlignment: WrapAlignment.start,
          children: flowTagBean.asMap().keys.map((index) {
            var bean = flowTagBean[index];
            return FlowTagWidget(UniqueKey(),{
              'parentBean': headerData,
              'headerIndex': headerIndex,
              'bean': bean,
              'index': index
            });
          }).toList(),
        )
      ],
    );
  }
}


/*class HistoryRecommendWidget extends StatelessWidget {
  var data;

  HistoryRecommendWidget();

  @override
  Widget build(BuildContext context) {
    data = Provider.of<SearchProviderModel>(context).data;


    return Container(
        padding: EdgeInsets.only(left: 10, right: 10, top: 5),
        child: ListView.separated(
            itemBuilder: (context, index) {
              var itemData = data[index];
              var key = itemData.keys.toList()[0];
              return _createWrapWidget(index, key, itemData[key]);
            },
            separatorBuilder: (context, index) {
              return Divider(
                  color: Colors.white,
                  height: ScreenUtil.getInstance().setHeight(40));
            },
            itemCount: data != null ? data.length : 0));
  }

  Widget _crateHeaderWidget(FlowTagBean headerData) {
    return Container(
      height: ScreenUtil.getInstance().setHeight(120),
      child: Row(
        children: <Widget>[
          Offstage(
            offstage: headerData.leftIcon == null,
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                  width: 15,
                  height: 15,
                  child: ImageUtils.getImageWidget(
                      headerData.leftIcon, headerData.imageType)),
            ),
          ),
          Expanded(
              child: Text(
            headerData.content,
            style: TextStyle(color: Color(0xff9c9c9c), fontSize: 16),
          )),
          Offstage(
              offstage: headerData.rightIcon == null,
              child: Container(
                  width: 20,
                  height: 20,
                  child: ImageUtils.getImageWidget(
                      headerData.rightIcon, headerData.imageType)))
        ],
      ),
    );
  }

  Widget _createWrapWidget(
      int headerIndex, FlowTagBean headerData, List<FlowTagBean> flowTagBean) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _crateHeaderWidget(headerData),
        Wrap(
          spacing: 4,
          runSpacing: 2,
          runAlignment: WrapAlignment.start,
          children: flowTagBean.asMap().keys.map((index) {
            var bean = flowTagBean[index];
            return FlowTagWidget({
              'parentBean': headerData,
              'headerIndex': headerIndex,
              'bean': bean,
              'index': index
            });
          }).toList(),
        )
      ],
    );
  }





}*/
