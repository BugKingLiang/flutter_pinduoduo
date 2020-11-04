import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pingduoduo/util/color_constant.dart';
import 'package:pingduoduo/util/image_utls.dart';
import 'package:pingduoduo/util/utils.dart';
import 'package:pingduoduo/widgets/circular_image_widget.dart';
import 'package:pingduoduo/widgets/divider_dart.dart';

class HorizontalSlideWidgets extends StatelessWidget {
  var data;

  HorizontalSlideWidgets(this.data);

  @override
  Widget build(BuildContext context) {
    int type = data['type'] as int;
    print(' type  = ${type}');
    switch (type) {
      case 10:
        return _createType10(data['subject_info'], data['subject_list']);
        break;
      case 11 :
        {
          return _createGroupBuying(data['subject_info'], data['subject_list']);
        }
      case 8 :
        {
          return _createBeastSeller(data['subject_info'], data['subject_list']);
        }
      case 2:
        {
          return _createBusinessWidget(
              data['subject_info'], data['subject_list']);
        }
    }
  }

  //万人团,正在疯抢小图片
  List<Widget> _createTagIcon(List tagIcons) {
    List<Widget> widgets = List();
    double padding = 0;
    double imageWidth = ScreenUtil().setWidth(60);

    for (int i = 0; i < tagIcons.length; i++) {
      var widget = CirculuarImageWidget(imageWidth, tagIcons[i]);
      if (i > 0) {
        padding += imageWidth / 3 * 2;
      }
      widgets.add(Positioned(child: widget, left: padding));
    }

    return widgets;
  }

  //万人团,商品属性
  List<Widget> _createGoupBuyGoodsWidget(List goods) {
    List<Widget> widgets = List();

    for (int i = 0; i < goods.length; i++) {
      var itemData = goods[i];
      //向上取整
      int price = ((itemData['price'] as int) / 100).ceil();

      var widget = Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CachedNetworkImage(imageUrl:itemData['hd_thumb_url'],
                width: ScreenUtil().setWidth(210),
                height: ScreenUtil().setWidth(210),
                fit: BoxFit.cover),
            Container(
              color: i < 2 ? Color(0xfffcefef) : Color(0xfffcf4e1),
              margin: const EdgeInsets.only(top: 2),
              child: Text(itemData['sales_tip'],
                  style: TextStyle(
                    color: i < 2 ? Color(0xffe02e24) : Color(0xfffab106),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Text('¥$price',
                  style: TextStyle(
                      color: Color(0xffe02e24), fontWeight: FontWeight.w700)),
            ),
          ],
        ),
      );
      widgets.add(widget);
    }

    widgets.insert(
        2,
        Container(
          height: ScreenUtil().setHeight(210),
          width: ScreenUtil().setWidth(1),
          color: Colors.grey[200],
        ));

    return widgets;
  }

  //万人团购 type==1
  Widget _createGroupBuying(var subJectInfo, List goods) {
    var title = subJectInfo['subject'];
    var jumpText = subJectInfo['jump_text'];
    var tagList = subJectInfo['tag_list'];
    var iconList = subJectInfo['ext']['icon_list'];
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 5, right: 5),
      height: ScreenUtil().setHeight(600),
      child: Column(
        children: <Widget>[
          DividerWidget(height: 10),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              children: <Widget>[
                Image.asset(ImageUtils.getImagePath('home/ag4'),
                    width: ScreenUtil().setWidth(50),
                    height: ScreenUtil().setWidth(50)),
                Text(title,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                Expanded(
                  child: _createCheckMoreWidget(jumpText),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Row(
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 50,
                          height: ScreenUtil().setHeight(60),
                          child: Stack(
                            children: _createTagIcon(iconList),
                            alignment: Alignment.centerLeft,
                          ),
                        ),

                        Text(
                          tagList[0],
                          style: TextStyle(color: Color(0xffe02e24)),
                        ) //正在疯抢
                      ],
                    )),
                Expanded(
                    flex: 1,
                    child: Text(/*tagList[1]*/'即将开始',
                        style: TextStyle(color: Color(0xfffab106))))
                //即将开抢
              ],
            ),
          ),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: _createGoupBuyGoodsWidget(goods),
          )),
          Container(
              margin: EdgeInsets.only(top: 3), child: DividerWidget(height: 10))
        ],
      ),
    );
  }

  //查看更多
  Widget _createCheckMoreWidget(String jumpText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Text(jumpText,
            style: TextStyle(color: ColorConstant.text_gray, fontSize: 14)),
        Padding(
            padding: EdgeInsets.only(left: 5),
            child: Image.asset(ImageUtils.getImagePath('home/a56'),
                width: ScreenUtil().setWidth(30),
                height: ScreenUtil().setWidth(30)))
      ],
    );
  }

  //畅销部件
  Widget _createBeastSeller(var subJectInfo, List goods) {
    var title = subJectInfo['subject'];
    var jumpText = subJectInfo['jump_text'];
    return Container(
      height: ScreenUtil().setHeight(600),
      child: Column(
        children: <Widget>[
          DividerWidget(height: 10),

          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: Row(
              children: <Widget>[
                Text(title),
                Expanded(child: _createCheckMoreWidget(jumpText))
              ],
            ),
          ),
          //商品属性部件
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
                children: goods.map((it) {
              return Expanded(
                  child: Stack(
                alignment: AlignmentDirectional.topStart,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3),
                      child: _createGoodsItem(it)),
                  Image.asset(ImageUtils.getImagePath('home/aa2'),
                      width: ScreenUtil().setWidth(80),
                      height: ScreenUtil().setWidth(80))
                ],
              ));
            }).toList()),
          )),

          DividerWidget(height: 10),
        ],
      ),
    );
  }

  //带有商家图片的部件
  Widget _createBusinessWidget(var subJectInfo, List goods) {
    var title = subJectInfo['subject'];
    var jumpText = subJectInfo['jump_text'];
    return Container(
      height: ScreenUtil().setHeight(700),
      child: Column(
        children: <Widget>[
          DividerWidget(height: 10),

          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            height: ScreenUtil().setWidth(150),
            child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CachedNetworkImage(imageUrl:  subJectInfo['logo'],
                    fit: BoxFit.fill),
                  Container(
                    margin: EdgeInsets.only(left: 5),
                      child: Text(title, textAlign: TextAlign.start)),
                  Expanded(child: _createCheckMoreWidget(jumpText))
                ]),
          ),
//          商品属性部件
          Expanded(

                child:Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: ListView.builder(
                    itemCount: goods.length,
                      physics: BouncingScrollPhysics(),
                      itemExtent: ScreenUtil().setWidth(330),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index){
                        return _createGoodsItem(goods[index]);
                  }),
                )
              ),

          DividerWidget(height: 10),
        ],
      ),
    );
  }

  Widget _createType10(var subject_info,List subject_list){
    return Container(
      color: Colors.white,
      height: ScreenUtil().setHeight(600),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: <Widget>[
          Container(
            height: ScreenUtil().setHeight(150),
            child: Row(

              children: <Widget>[
                Expanded(child: Align(
                  alignment: Alignment.centerRight,
                    child: Text('${subject_info['jump_text']} >')))
              ],

            ),
          ),

          Expanded(child: GridView.builder(
            shrinkWrap: true,physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, crossAxisSpacing: 5,childAspectRatio: 0.75),
              itemCount: subject_list.length,
              itemBuilder: (context, index) {
                    var item = subject_list[index];
                return Column(
                  children: <Widget>[
                    CachedNetworkImage(imageUrl: item['hd_thumb_url'],fit: BoxFit.cover,),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[

                        Text('¥${Utils.convertPrice(item['price'])}',style: TextStyle(color: Color(0xffe02e24),fontSize: 16,fontWeight: FontWeight.w600),),
                        Container(
                          margin: EdgeInsets.only(left: 3),
                            child: Text('${Utils.convertPrice(item['normal_price'])}',style: TextStyle(color: Color(0xff9c9c9c),fontSize: 12,decoration: TextDecoration.lineThrough))),
                      ],),
                    )

                  ],
                );
              }))


        ],

      )

    );
  }

  Widget _createGoodsItem(var goods) {
    double price = (goods['price'] as int) / 100;
    double normalPrice = (goods['normal_price'] as int) / 100;

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 2),
          width: ScreenUtil().setWidth(300),
          height: ScreenUtil().setWidth(300),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: CachedNetworkImage(imageUrl:goods['hd_thumb_url'], fit: BoxFit.fill),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 5, bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('¥$price',
                  style: TextStyle(color: Color(0xffe02e24), fontSize: 14)),
              Padding(
                padding: const EdgeInsets.only(left: 3),
                child: Text(
                  '¥$normalPrice',
                  style: TextStyle(
                      color: ColorConstant.text_gray,
                      fontSize: 12,
                      decoration: TextDecoration.lineThrough),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
