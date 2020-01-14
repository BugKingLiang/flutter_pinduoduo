import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pingduoduo/util/color_constant.dart';
import 'package:pingduoduo/util/utils.dart';
import 'package:pingduoduo/widgets/circular_image_widget.dart';
import 'package:pingduoduo/widgets/divider_dart.dart';

class GoodsItemWidget extends StatelessWidget {
  String _goodsImage;
  String _goodsName;
  int _goodsPrice;
  int _sales;
  List nearGroup;

  GoodsItemWidget(this._goodsImage, this._goodsName, this._goodsPrice,
      this._sales, this.nearGroup); //已拼件数

  @override
  Widget build(BuildContext context) {
    double itemHeight = ScreenUtil().setHeight(400);

    return Container(
      color: Colors.white,
      height: itemHeight,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            Container(
                width: itemHeight,
                height: itemHeight,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),

                  child: CachedNetworkImage(imageUrl:_goodsImage, fit: BoxFit.fill),
                )),
            Expanded(
                child: Container(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    _goodsName,
                    maxLines: 2,
                    textAlign: TextAlign.left,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(
                      'xxxxxx专营店',
                      style: TextStyle(color: ColorConstant.text_gray),
                      maxLines: 1,
                    ),
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
//                      Text('111111111111111111'),
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
                    ],
                  )),
                  Container(
                    margin: EdgeInsets.only(top: 3),
                    child: DividerWidget(),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  List<Widget> _createNearGroup() {
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
}
