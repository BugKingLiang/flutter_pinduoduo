import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageUtils {
  static ImageProvider getAssetsImage(String name, {String format: "png"}) {
    return AssetImage(getImagePath(name, format: format));
  }

  static String getImagePath(String name, {String format: "png"}) {
    return 'assets/images/$name.$format';
  }
  static String getSvgImagePath(String name, {String format: "svg"}) {
    return 'assets/svg/$name.$format';
  }

  static Widget getImageWidget(String image,ImageType imageType) {

    switch(imageType){
      case ImageType.LOCAL_PNG:
        return Image.asset(getImagePath(image));
      case ImageType.LOCAL_SVG:

        return SvgPicture.asset(getSvgImagePath(image));

      case ImageType.NETWORKE:

        return CachedNetworkImage(imageUrl: image);
    }
  }
}

enum ImageType{
  LOCAL_PNG,//本地
  LOCAL_SVG,
  NETWORKE //网络类型
}