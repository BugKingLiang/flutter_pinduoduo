import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pingduoduo/widgets/filter_widget.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.getInstance().init(context);

    return Scaffold(
        appBar: PreferredSize(
      child: AppBar(
          elevation: 0,
          brightness: Brightness.light,
          backgroundColor: Colors.white),
      preferredSize: Size.fromHeight(0),
    ),
    body: FilterWidget(ScreenUtil.instance.setHeight(600),null),
    );
  }
}
