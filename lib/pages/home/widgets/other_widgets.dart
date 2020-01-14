import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pingduoduo/util/color_constant.dart';
import 'package:pingduoduo/util/image_utls.dart';
import 'package:pingduoduo/widgets/divider_dart.dart';

class OtherWidgets extends StatelessWidget {
  var data;

  OtherWidgets(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
              height: ScreenUtil.getInstance().setWidth(500),
              child: _createCategoryWidget(data['opt2_list'])),
          DividerWidget(height: 10),
          _createOrderWidget(
              data['tab_content']['billboard']['billboard_list'][0]['title']),
          DividerWidget(height: 10),
          Image.network(data['tab_content']['banner_index_list'][0]['img_url']),
          DividerWidget(height: 10)
        ],
      ),
    );
  }

  Widget _createCategoryWidget(List categorys) {

    return GridView.builder(
        itemCount: categorys.length,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5, childAspectRatio: 0.86, mainAxisSpacing: 2),
        itemBuilder: (context, index) {
          var item = categorys[index];
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                    width: ScreenUtil.getInstance().setWidth(190),
                    height: ScreenUtil.getInstance().setWidth(190),
                    child: index < categorys.length - 1
                        ? Container(padding:EdgeInsets.symmetric(vertical: 5),child:Image.network(item['image_url'], fit: BoxFit.fill))
                        : Padding(padding: EdgeInsets.all(20),child:Image.asset(ImageUtils.getImagePath('home/agm')))),
                Expanded(
                  child: Text(item['opt_name'],
                      style: TextStyle(fontSize: 12, color: Color(0xff666666))),
                )
              ],
            ),
          );
        });
  }

  Widget _createOrderWidget(String title) {
    return Container(
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Image.asset(ImageUtils.getImagePath('home/order')),
          Text(title, style: TextStyle(fontWeight: FontWeight.w700)),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                child: Text('高销量/好口碑',
                    style: TextStyle(
                        color: ColorConstant.text_gray, fontSize: 14)),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Image.asset(ImageUtils.getImagePath('home/a56'),
                      width: ScreenUtil().setWidth(30),
                      height: ScreenUtil().setWidth(30)))
            ],
          ))
        ],
      ),
    );

    /*return ListTile(

      leading: Image.asset(ImageUtils.getImagePath('home/order')),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.w700)),
      trailing: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(
            child: Text('高销量/好口碑',
                style: TextStyle(color: ColorConstant.text_gray, fontSize: 14)),
          ),
          Padding(
              padding: EdgeInsets.only(left: 5),
              child: Image.asset(ImageUtils.getImagePath('home/a56'),
                  width: ScreenUtil().setWidth(30),
                  height: ScreenUtil().setWidth(30)))
        ],
      ),
    );*/
  }
}
