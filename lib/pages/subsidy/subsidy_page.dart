import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pingduoduo/storage/sp_data.dart';

class SubsidyPage extends StatefulWidget {
  @override
  _SubsidyPageState createState() => _SubsidyPageState();
}

class _SubsidyPageState extends State<SubsidyPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            child: AppBar(
              brightness: Brightness.dark,
              elevation: 0,
            ),
            preferredSize: Size.fromHeight(0)),
        body: Column(
          children: <Widget>[

            NestedScrollView(
              headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
                return <Widget>[
                  SliverToBoxAdapter(
                    child: Container(
                      height: ScreenUtil.getInstance().setHeight(200),
                      color: Colors.green,
                    ),
                  ),

                ];
              },
              body: Container(),
            )



          ],
        ));
  }
}
