import 'package:flutter/material.dart';

class ContainerDivider extends StatelessWidget {
  double dividerHeight;

  Color dividerColor;
  double topDividerLeftMargin;
  double topDividerRightMargin;
  double topDividerHeight;
  Color topDividerColor;
  bool showTopDivider;

  double bottomDividerLeftMargin;
  double bottomDividerRightMargin;
  double bottomDividerHeight;
  Color bottomDividerColor;
  bool showBottomDivider;

  Widget child;

  ContainerDivider({@required this.child,
      this.dividerColor = const Color(0xfff4f4f4),
        this.dividerHeight = 0.5,
        this.topDividerLeftMargin = 0,
        this.topDividerRightMargin = 0,
        this.topDividerHeight,
        this.topDividerColor,

        this.bottomDividerLeftMargin = 0,
        this.bottomDividerRightMargin = 0,
        this.bottomDividerHeight,
        this.bottomDividerColor,
        this.showTopDivider = true,
        this.showBottomDivider = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Offstage(
          offstage: !showTopDivider,
          child: Divider(
              height: topDividerHeight??dividerHeight,
              thickness: topDividerHeight??dividerHeight,
              indent: topDividerLeftMargin,
              endIndent: topDividerRightMargin,
              color: dividerColor),
        ),
        child,
        Offstage(
          offstage: !showBottomDivider,
          child: Divider(
              height: bottomDividerHeight??dividerHeight,
              thickness: bottomDividerHeight??dividerHeight,
              indent: bottomDividerLeftMargin,
              endIndent: bottomDividerRightMargin,
              color: dividerColor),
        ),
      ],
    );
  }
}
