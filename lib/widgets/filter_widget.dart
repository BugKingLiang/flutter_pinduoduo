import 'package:flutter/material.dart';

//筛选框
class FilterWidget extends StatefulWidget {

  double height;
  OverlayEntry popupWindow;

  FilterWidget(this.height,this.popupWindow);

  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: widget.height,
            color: Colors.green,
          ),

          Expanded(child: GestureDetector(child: Container(color: Colors.black45),onTap: (){
            widget.popupWindow.remove();
          },))

        ],
      ),

    );
  }



}
