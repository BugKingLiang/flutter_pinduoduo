import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {

  double height;

  DividerWidget({this.height = 1});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Divider(
        height: height,
        thickness: height,
        color: Colors.grey[100]
      ),
    );
  }
}
