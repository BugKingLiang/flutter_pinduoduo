import 'dart:math';

import 'package:flutter/material.dart';

class ColorConstant{

  static const Color bottomTitleColor =Color.fromARGB(255, 224, 46, 36);
  static const Color primaryColor =Color.fromARGB(255,230,59,49);
  static const Color text_gray = Color(0xff9c9c9c);



  static Color getRandomColor() {
    return Color.fromARGB(255, Random.secure().nextInt(255),
        Random.secure().nextInt(255), Random.secure().nextInt(255));
  }
}