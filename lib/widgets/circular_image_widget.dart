import 'package:flutter/material.dart';

class CirculuarImageWidget extends StatelessWidget {
  double radius;
  Color borderColor;
  String imageUrl;

  CirculuarImageWidget(this.radius, this.imageUrl,{this.borderColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius,
        height: radius,

        decoration: BoxDecoration(
          color: borderColor,
          border: Border.all(color: borderColor,width: 1),
            borderRadius: BorderRadius.circular(radius),
            image: DecorationImage(
                image: NetworkImage(imageUrl), fit: BoxFit.cover)));
  }
}
