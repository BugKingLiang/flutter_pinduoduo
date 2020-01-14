import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pingduoduo/util/image_utls.dart';
import 'package:pingduoduo/widgets/border_text_widget.dart';

class MessageItemWidget extends StatelessWidget {

  String _leading;
  LeadingType leadingType;
  String _title;
  bool displayTitleIcon =true; //fasle 显示,true:不显示
  String _subTitle;
  String _Data;
  int messageNumber;


  MessageItemWidget(this._leading, this._title, this._subTitle, this._Data,
  {this.leadingType = LeadingType.URL_TYPE,this.messageNumber,this.displayTitleIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
          leading: leadingType ==LeadingType.URL_TYPE?CachedNetworkImage(imageUrl: _leading):Image.asset(ImageUtils.getImagePath(_leading)),
          title: Row(
            children: <Widget>[
              Text(_title),
              Offstage(
                offstage: !displayTitleIcon,
                child: Container(margin:EdgeInsets.only(left: 5),child: BorderTextWidget('官方')),
              )

            ],
          ),
          subtitle: Text(_subTitle,maxLines: 1,overflow: TextOverflow.ellipsis,),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(_Data,style: TextStyle(color: Color(0xffbdbdbd),fontSize: 12),),
              Offstage(
                offstage: messageNumber == 0,
                child: Container(
                  margin: EdgeInsets.only(top: 3),
                  child: Badge(
                    animationType: BadgeAnimationType.fade,
                    elevation: 0,
                    badgeContent: Text(messageNumber.toString(),style: TextStyle(fontSize: 10,color: Colors.white),),
                  ),
                ),
              )

            ],
          )

      ),
    );
  }
}
enum LeadingType {
  FILE_TYPE,URL_TYPE
}
