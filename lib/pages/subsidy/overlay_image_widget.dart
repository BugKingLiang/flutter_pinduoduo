import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class OverlayImageWidget extends StatelessWidget {

  String image;


  OverlayImageWidget({@required this.image});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          CachedNetworkImage(imageUrl: image),
          ConstrainedBox(constraints: BoxConstraints.expand(),
          child: Container(color: Colors.grey.withOpacity(0.1),),)


        ],
      ),
    );
  }
}
