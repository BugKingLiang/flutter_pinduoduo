import 'package:flutter/material.dart';

typedef OnSelected =  Function();

class RadioLayout extends StatefulWidget {


  List<Widget> children;

  OnSelected onSelected;


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
          onTap: widget.onSelected,
        );

      }).toList(),
    );
  }



}
