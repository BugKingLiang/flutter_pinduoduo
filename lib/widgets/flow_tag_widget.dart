import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pingduoduo/bean/flow_tag_bean.dart';
import 'package:pingduoduo/provider/search_provider.dart';
import 'package:pingduoduo/util/image_utls.dart';
import 'package:provider/provider.dart';

class FlowTagWidget extends StatefulWidget {


  var data;

  FlowTagWidget(Key key,this.data):super(key:key);

  @override
  _FlowTagWidgetState createState() =>
      _FlowTagWidgetState(data);

}

class _FlowTagWidgetState extends State<FlowTagWidget> {


  bool _showDeleteIcon =false;
  FlowTagBean bean;

  var data;

  _FlowTagWidgetState(this.data);

  @override
  void initState() {
    bean = data['bean'];
    super.initState();


  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: <Widget>[
        GestureDetector(
          onLongPress: bean.supportLongClick ? () { //手指长按
            setState(() {
              _showDeleteIcon = true;
            });
          } : null,
          child: Container(
              margin: EdgeInsets.only(top: 5),
              padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
              decoration: BoxDecoration(
                color: Color(0xfff4f4f4),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Offstage(
                    offstage: bean.leftIcon == null,
                    child: Container(

                        width: ScreenUtil.getInstance().setWidth(40),
                        height: ScreenUtil.getInstance().setWidth(40),

                        child: ImageUtils.getImageWidget(
                            bean.leftIcon, bean.imageType)),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 3),
                    child: Text(
                      bean.content,
                      style: TextStyle(color: Color(0xff58595b),fontSize: 12),
                    ),
                  ),
                  Offstage(
                    offstage: bean.rightIcon == null,
                    child: Container(
                        width: ScreenUtil.getInstance().setWidth(40),
                        height: ScreenUtil.getInstance().setWidth(40),
                        child: ImageUtils.getImageWidget(
                            bean.rightIcon, bean.imageType)),
                  ),
                ],
              )),
        ),

        Positioned(
          top: 2,
          child: Offstage(

              offstage: !_showDeleteIcon,
              child: GestureDetector(child: SizedBox(width: 15,
                  height: 15,
                  child: CircleAvatar(child: Text(
                      '×', style: TextStyle(fontSize: 10, color: Colors.white)),
                    backgroundColor: Color(0xff9c9c9c),)),
                onTap: () {
                Provider.of<SearchProviderModel>(context).removeHistorySearch(
                    data['parentBean'], data['index']);
              },
              )
          ),
        ),

      ],
    );
  }


}
