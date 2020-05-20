import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pingduoduo/bean/goods_config_bean.dart';
import 'package:pingduoduo/util/image_utls.dart';

class GoodsConfigWidget extends StatelessWidget {
  List<GoodsConfigBean> configs = [
    GoodsConfigBean(image: 'icons/memory',title: '运行内存',configInfo: '12GB;8GB'),
    GoodsConfigBean(image: 'icons/screen_size',title: '超大屏',configInfo: '6.67英寸'),
    GoodsConfigBean(image: 'icons/screen_pixel',title: '分辨率 ',configInfo: '2340X1080像素'),
    GoodsConfigBean(image: 'icons/front_camera',title: '前置摄像头',configInfo: '2000万像素'),
    GoodsConfigBean(image: 'icons/thickness',title: '机身厚度',configInfo: '8.96mm'),
    GoodsConfigBean(image: 'icons/battery',title: '超长待机',configInfo: '4500mAh'),

  ];

//  GoodsConfigWidget(this.configs);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil.getInstance().setHeight(240),
      child: ListView.separated(
          itemBuilder: (context, index) {

            return _createItemWidget(configs[index]);
          },
          separatorBuilder: (context, index) {
            return VerticalDivider(width: 1,thickness:1,indent: 10,endIndent: 10,color: Color(0xfff2f2f2));
          },
          itemCount: configs.length,scrollDirection: Axis.horizontal,),
    );
  }


  Widget _createItemWidget(GoodsConfigBean bean ){

    var size = ScreenUtil.getInstance().setWidth(50);
    return Container(
      width: ScreenUtil.getInstance().setWidth(240),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(ImageUtils.getImagePath(bean.image),width: size,height: size,),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(bean.title,style: TextStyle(color: Color(0xff58595b),fontSize: 14)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Text(bean.configInfo,style: TextStyle(color: Color(0xff9c9c9c)),maxLines: 1,overflow: TextOverflow.ellipsis,),
          ),


        ],
      ),
    );


  }

}
