import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pingduoduo/bean/message_bean.dart';
import 'package:pingduoduo/storage/http/api.dart';
import 'package:pingduoduo/pages/message/message_item_widget.dart';
import 'package:pingduoduo/storage/mock_data.dart';
import 'package:pingduoduo/util/color_constant.dart';
import 'package:pingduoduo/widgets/divider_dart.dart';
import 'package:pingduoduo/widgets/goods_info_widget.dart';

class MessagePage extends StatefulWidget {
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> with AutomaticKeepAliveClientMixin {


  List recommendData;

  int offset = 0;

  @override
  void initState() {
    super.initState();
    recommendData = List();
    requestRecommendData();

  }


  void requestRecommendData(){

    Api.instance.requestMessageRecommendData(offset).then((response){
      setState(() {
        recommendData.addAll(response.data['data']);
      });

    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('聊天', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        brightness: Brightness.dark,
        backgroundColor: ColorConstant.primaryColor,
        elevation: 1,
      ),
      body: Container(
        color: Colors.white,
        child: CustomScrollView(
          slivers: <Widget>[_messageList(),
            _createRecommendHeaderWidget(),
            _createRecommendWidgets()
          ],
        ),
      ),
    );
  }

  //消息列表
  Widget _messageList() {
    return SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
      MessageBean bean = MockData.messages[index];
      return MessageItemWidget(
          bean.leading, bean.title, bean.subtitle, bean.date,
          leadingType: bean.leadingType,
          messageNumber: bean.messageNumber,
          displayTitleIcon: bean.displayTitleIcon);
    }, childCount: MockData.messages.length));
  }

  SliverToBoxAdapter _createRecommendHeaderWidget(){
    return SliverToBoxAdapter(
      child: Offstage(
        offstage: recommendData.isEmpty,
        child: Container(
          height: ScreenUtil.instance.setHeight(130),
          child: Column(
            children: <Widget>[
              DividerWidget(height: ScreenUtil.instance.setHeight(20)),
               Container(child: Center(child: Text('精选推荐',style: TextStyle(color: Colors.red,fontSize: 18))))

            ],
          ),
        ),
      ),
    );


  }

  SliverGrid _createRecommendWidgets() {
    return SliverGrid(delegate: SliverChildBuilderDelegate((context, index) {
      var item = recommendData[index];
      var iconList = item['icon_list'];
      return GoodsInfoWidget(
          item['hd_thumb_url'],
          //切记不要直接使用ScreenUtil.getInstance().width/2
         ScreenUtil.screenWidth/ 2,
          iconList != null ? iconList[0]['url'] : null,
          item['goods_name'],
          item['tag_list'],
          item['min_on_sale_group_price'],

          item['sales_tip'],
          null,
          /*item['near_group']['list'],*/
          lrWidget: LowerRightWidget.none);
    }, childCount: recommendData.length
    ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 2, childAspectRatio: 0.7));
  }

  @override
  bool get wantKeepAlive => true;



}
