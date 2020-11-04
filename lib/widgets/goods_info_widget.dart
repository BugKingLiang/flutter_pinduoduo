import 'dart:core';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pingduoduo/util/color_constant.dart';
import 'package:pingduoduo/util/utils.dart';
import 'package:pingduoduo/widgets/find_widget.dart';

import 'circular_image_widget.dart';

class GoodsInfoWidget extends StatelessWidget {
  String _gooddsImage;
  double _goodsImageSize;

  String _goodsActionImage;
  String _goodsName;
  List _tags;
  int _price;
  String _saller;
  List icons;

  LowerRightWidget lrWidget;//右下角部件

  GoodsInfoWidget(
      this._gooddsImage,
      this._goodsImageSize,
      this._goodsActionImage,
      this._goodsName,
      this._tags,
      this._price,
      this._saller,
      this.icons,{this.lrWidget = LowerRightWidget.none});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
              child: CachedNetworkImage(imageUrl:_gooddsImage,
                  fit: BoxFit.cover,
                  width: _goodsImageSize)),
          Row(
            children: <Widget>[
              _goodsActionImage != null?
              Container(
                  width: ScreenUtil().setWidth(120),
                  height: ScreenUtil().setHeight(40),
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: CachedNetworkImage(imageUrl:
                    _goodsActionImage,
                    fit: BoxFit.fill,
                  )):Container(),
              Expanded(
                  child: Text(
                _goodsName,
                maxLines: 1,
              ))
            ],
          ),
          Row(children: _createTagsWidget(_tags)),
          Expanded(
              child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            margin: EdgeInsets.only(bottom: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text.rich(
                      TextSpan(children: [
                        TextSpan(text: '¥', style: TextStyle(fontSize: 12)),
                        TextSpan(
                            text: Utils.convertPrice(_price),
                            style: TextStyle(fontSize: 16))
                      ]),
                      style: TextStyle(
                          color: Color(0xffe02e24),
                          fontWeight: FontWeight.w700),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 3),
                      child: Text(_saller,
                          style: TextStyle(
                              color: ColorConstant.text_gray, fontSize: 12)),
                    ),
                    Expanded(
                        child: Container(
                      child: getLowerRightWidget()/*Stack(
                        alignment: AlignmentDirectional.centerEnd,
                        children: _createNearGroup(icons),
                      )*/,
                    ))
                  ],
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }

  List<Widget> _createTagsWidget(List tags) {
    List<Widget> widgets = List();
    if(tags == null || tags.isEmpty){
      return widgets;

    }

    for (int i = 0; i < tags.length; i++) {
      if(i > 1){break;}
      var item = tags[i];
      //
      widgets.add(Container(
          color: Color(0x19FF5706),
          margin: EdgeInsets.only(left: i > 0 ? 3 : 5),
          child: Text(
            item['text'],
            style: TextStyle(color: Color(0xffff5706)),
          )));
    }
    return widgets;
  }

  List<Widget> _createNearGroup(List nearGroup) {
    List<Widget> widgets = List();
    if (nearGroup != null) {
      if (nearGroup.length == 1) {
        widgets.add(CirculuarImageWidget(
            ScreenUtil().setWidth(50), nearGroup[0]['avatar']));
      } else {
        widgets.add(Positioned(
          child: CirculuarImageWidget(
              ScreenUtil().setWidth(50), nearGroup[0]['avatar']),
          right: 10,
        ));
        widgets.add(CirculuarImageWidget(
            ScreenUtil().setWidth(50), nearGroup[1]['avatar']));
      }
    } else {
      widgets.add(Container());
    }

    return widgets;
  }

  Widget getLowerRightWidget(){
    switch(lrWidget){
      case LowerRightWidget.none:
        return Container();

      case LowerRightWidget.near_group:
        return  Container(
            child: Stack(
            alignment: AlignmentDirectional.centerEnd,
            children: _createNearGroup(icons),
    ));
      case LowerRightWidget.find:

        return FindWidget(ScreenUtil().setWidth(120), ScreenUtil().setHeight(70), 10,borderColor: Color(0xffc6c6c6));

    }
  }

}
enum LowerRightWidget{
  none,near_group,find
}
