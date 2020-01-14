import 'package:pingduoduo/pages/message/message_item_widget.dart';

class MessageBean{

  String leading;
  LeadingType leadingType;

  String title;
  bool displayTitleIcon;
  String subtitle;
  String date;
  int messageNumber;

  MessageBean(this.leading,this.leadingType, this.title, this.displayTitleIcon, this.subtitle,
      this.date, this.messageNumber);


}