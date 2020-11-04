import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//商品
class GoodsInfoTitleWidget extends StatelessWidget {

  List leadingIcons;
  String title;

  GoodsInfoTitleWidget({this.leadingIcons, this.title});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
        TextSpan(
        children: _createIconsWithTitle()),maxLines: 2);
  }

  List<InlineSpan> _createIconsWithTitle() {
    List<InlineSpan> spans = List();

    var tagSpan = leadingIcons?.map((value) {
      return WidgetSpan(
          alignment: PlaceholderAlignment.middle,
          child: Image.network(value,
              width: ScreenUtil().setWidth(120),
              height: ScreenUtil().setHeight(40),fit: BoxFit.fill,));
    })?.toList();

    if (tagSpan != null) {
      spans.addAll(tagSpan);
    }

    spans.add(TextSpan(text: title, style: TextStyle(color: Colors.black)));

    return spans;
  }

}
