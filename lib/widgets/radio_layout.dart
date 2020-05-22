import 'package:flutter/material.dart';



class RadioLayout extends StatefulWidget {


  List<Widget> children;

  @override
  _RadioLayoutState createState() => _RadioLayoutState();
}

class _RadioLayoutState extends State<RadioLayout> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: widget.children.map((child){

        return GestureDetector(
          child: child,
        );

      }).toList(),
    );
  }



}
