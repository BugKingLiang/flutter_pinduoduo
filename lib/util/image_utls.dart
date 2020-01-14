import 'package:flutter/material.dart';

class ImageUtils {
  static ImageProvider getAssetsImage(String name, {String format: "png"}) {
    return AssetImage(getImagePath(name, format: format));
  }

  static String getImagePath(String name, {String format: "png"}) {
    return 'assets/images/$name.$format';
  }
}
