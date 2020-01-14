import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pingduoduo/util/image_utls.dart';

class ImagetTextWidget extends StatelessWidget {
  bool filePath = false; //是否,是本地图片
  String imagePath;
  String titleName;
  double imageSize;
  Color textColor;
  double titleSize;

  ImagetTextWidget(this.titleName, this.imagePath, {this.filePath = false,this.textColor,this.titleSize = 14,this.imageSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      /*color: ColorConstant.getRandomColor(),*/
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          filePath
              ? Image.asset(ImageUtils.getImagePath(imagePath),width: imageSize,height: imageSize,fit: BoxFit.fill)
              : CachedNetworkImage(imageUrl: imagePath, fit: BoxFit.fill),
          Text(titleName,style: TextStyle(color: textColor,fontSize: titleSize),)
        ],
      ),
    );
  }
}
