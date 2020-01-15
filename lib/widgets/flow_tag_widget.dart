import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FlowTagWidget extends StatefulWidget {
  Function onDeletClick;


  FlowTagWidget(this.onDeletClick);

  @override
  _FlowTagWidgetState createState() => _FlowTagWidgetState(onDeletClick);

}

class _FlowTagWidgetState extends State<FlowTagWidget> {

  bool _showDeleteIcon = false;

  Function onDeletClick;

  _FlowTagWidgetState(this.onDeletClick);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: <Widget>[
        GestureDetector(
          onLongPress: (){  //手指长按
            setState(() {
              _showDeleteIcon = true;
            });
          },
          child: Container(
              margin: EdgeInsets.only(top: 5),
              padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
              decoration: BoxDecoration(
                color: Color(0xfff4f4f4),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Offstage(
                    offstage: true,
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.store_mall_directory)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text(
                      '对付恐惧啊',
                      style: TextStyle(color: Color(0xff58595b)),
                    ),
                  ),
                  Offstage(
                    offstage: true,
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.store_mall_directory)),
                  ),
                ],
              )),
        ),

          Positioned(
            child: Offstage(

                offstage:!_showDeleteIcon,child: GestureDetector(child: Text('×'),onTap: onDeletClick,)),
          ),

      ],
    );
  }




}
