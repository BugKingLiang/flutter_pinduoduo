import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class TextBoundImage extends StatelessWidget {
  double imageRadius;
  double padding; //图片和文字的间隔
  String text;
  String topImageUrl;
  String leftImageUrl;
  String rightImageUrl;
  String bottomImageUrl;

  TextBoundImage(
      {@required this.text,
      this.topImageUrl,
      this.leftImageUrl,
      this.rightImageUrl,
      this.bottomImageUrl,
      this.padding = 8,
      this.imageRadius});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Offstage(
            offstage: topImageUrl == null,
            child: Padding(
              padding: EdgeInsets.only(bottom: padding),
              child: CircleAvatar(
                  radius: imageRadius,
                  backgroundColor: Colors.white,
                  backgroundImage: CachedNetworkImageProvider(topImageUrl??'')),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Offstage(
                offstage: leftImageUrl == null,
                child: Padding(
                  padding: EdgeInsets.only(right: padding),
                  child: CircleAvatar(
                      radius: imageRadius,
                      backgroundColor: Colors.white,
                      backgroundImage:
                          CachedNetworkImageProvider(leftImageUrl ?? '')),
                ),
              ),
              Text(text),
              Offstage(
                offstage: rightImageUrl == null,
                child: Padding(
                  padding:  EdgeInsets.only(left: padding),
                  child: CircleAvatar(
                      radius: imageRadius,
                      backgroundColor: Colors.white,
                      backgroundImage:
                          CachedNetworkImageProvider(rightImageUrl ?? '')),
                ),
              )
            ],
          ),
          Offstage(
            offstage: bottomImageUrl == null,
            child: Padding(
              padding: EdgeInsets.only(top: padding),
              child: CircleAvatar(
                  radius: imageRadius,
                  backgroundColor: Colors.white,
                  backgroundImage:
                      CachedNetworkImageProvider(bottomImageUrl ?? '')),
            ),
          )
        ],
      ),
    );
  }
}
