import 'package:pingduoduo/util/image_utls.dart';

class FlowTagBean{

  String leftIcon;
  String _content;
  String rightIcon;
  bool supportLongClick;
  ImageType imageType;

  FlowTagBean( this._content,{ this.leftIcon,this.rightIcon,this.imageType = ImageType.LOCAL_PNG,this.supportLongClick =false});


  String get content => _content;


}