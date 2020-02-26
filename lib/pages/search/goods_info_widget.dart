import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pingduoduo/util/color_constant.dart';
import 'package:pingduoduo/widgets/circular_image_widget.dart';
import 'package:pingduoduo/util/utils.dart';
import 'package:pingduoduo/widgets/divider_dart.dart';

class GoodsInfoWidget extends StatelessWidget {
  var _goodsImage;
  List _icon_list;
  String _goods_name;
  List _prop_tag_list;

  List _tag_list;
  List _near_group;

  int _goodsPrice;
  int _sales;


  GoodsInfoWidget(this._goodsImage, this._icon_list, this._goods_name,
      this._prop_tag_list, this._tag_list, this._near_group, this._goodsPrice,
      this._sales);

  @override
  Widget build(BuildContext context) {
    double itemHeight = ScreenUtil.getInstance().setHeight(350);
    return Container(
      height: itemHeight,
      child: Row(
        children: <Widget>[
          //商品图片
          Container(
              width: itemHeight,
              height: itemHeight,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: CachedNetworkImage(
                    imageUrl:_goodsImage,fit: BoxFit.fill),
              )),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  //标题
                  Container(
                    child:
                        Text.rich(TextSpan(children: _createIconsWithTitle())),
                  ),

                  _createPropTagWidget(),

                  Expanded(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,

                    children: <Widget>[
                      _createTagWidget(),
                      Row(
                        children: <Widget>[
                          Text.rich(
                            TextSpan(children: [
                              TextSpan(
                                  text: '¥', style: TextStyle(fontSize: 12)),
                              TextSpan(
                                  text: Utils.convertPrice(_goodsPrice),
                                  style: TextStyle(fontSize: 16))
                            ]),
                            style: TextStyle(
                                color: Color(0xffe02e24),
                                fontWeight: FontWeight.w700),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 3),
                            child: Text(Utils.calculateSales(_sales),
                                style: TextStyle(
                                    color: ColorConstant.text_gray,
                                    fontSize: 12)),
                          ),
                          Expanded(
                              child: Container(
                                child: Stack(
                                  alignment: AlignmentDirectional.centerEnd,
                                  children: _createNearGroup(),
                                ),
                              ))
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 3),
                        child: DividerWidget(),
                      )

                    ],


                  ))

                ],
              ),
            ),
          )
        ],
      ),
    );
  }

//标题
  List<InlineSpan> _createIconsWithTitle() {
    List<InlineSpan> spans = List();

    var tagSpan = _icon_list?.map((value) {
      return WidgetSpan(
          alignment: PlaceholderAlignment.middle,
          child: Image.network(value['url'],
              width: ScreenUtil.getInstance().setWidth(70),
              height: ScreenUtil.getInstance().setHeight(30)));
    })?.toList();

    if (tagSpan != null) {
      spans.addAll(tagSpan);
    }

    spans.add(TextSpan(text: _goods_name, style: TextStyle(color: Colors.black)));

    return spans;
  }

  Widget _createPropTagWidget() {
    String tagString ='';
    if (_prop_tag_list != null) {
      for (int i = 0; i < _prop_tag_list.length; i++) {
        tagString += '${_prop_tag_list[i]['text']}';
        if (i < _prop_tag_list.length-1) {
          tagString += ' | ';
        }
      }
    }
    return Offstage(
      offstage: tagString == null,
      child: Text(tagString,style: TextStyle(color: Color(0xff666666)),),
    );


  }
  Widget _createTagWidget(){
    List<Widget> tags = List();
    if (_tag_list != null && _tag_list.isNotEmpty) {

      for (int i = 0; i < _tag_list.length; i++) {
        tags.add(Container(
          margin: EdgeInsets.only(left: i > 0 ? 5 : 0),
          color: Color(0xffff5706).withOpacity(0.08),
          child: Text(_tag_list[i]['text'],
              style: TextStyle(color: Color(0xffff5706), fontSize: 12)),
        ));
      }


    }

    return Offstage(
      offstage: tags.isEmpty,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: tags,
      ),
    );





  }

  List<Widget> _createNearGroup() {
    List<Widget> widgets = List();
    if (_near_group != null) {
      if (_near_group.length == 1) {
        widgets.add(CirculuarImageWidget(
            ScreenUtil().setWidth(50), _near_group[0]['avatar']));
      } else {
        widgets.add(Positioned(
          child: CirculuarImageWidget(
              ScreenUtil().setWidth(50), _near_group[0]['avatar']),
          right: 10,
        ));
        widgets.add(CirculuarImageWidget(
            ScreenUtil().setWidth(50), _near_group[1]['avatar']));
      }
    } else {
      widgets.add(Container());
    }

    return widgets;
  }
}

