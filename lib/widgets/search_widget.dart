import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pingduoduo/provider/search_provider.dart';
import 'package:pingduoduo/util/color_constant.dart';
import 'package:pingduoduo/util/image_utls.dart';
import 'package:provider/provider.dart';

//搜索框的样式
class SearchWidget extends StatelessWidget {
  double _imageSize;
  Color bgColor;

  String content;
  SearchType searchType;
  TextEditingController controller;

  bool _showClearIcon = false;

  SearchWidget(this.content,
      {this.bgColor = Colors.white,
      this.searchType = SearchType.ONLY_SHOW_TYPE,
      this.controller});

  @override
  Widget build(BuildContext context) {
    _imageSize = ScreenUtil.getInstance().setWidth(60);

    switch (searchType) {
      case SearchType.SEARCH_RESULT_TYPE:
      case SearchType.SEARCH_TYPE:
        return _createTextFieldType(context);

      default:
        return _createTabarShowType(context);
    }
  }

  Widget _createTabarShowType(BuildContext context) {
    return Container(
      color: bgColor,
      padding: EdgeInsets.all(10),
      child: Container(
        height: ScreenUtil.getInstance().setHeight(100),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3), color: Color(0xffededed)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(ImageUtils.getImagePath('main/apj'),
                    fit: BoxFit.fill, width: _imageSize, height: _imageSize),
                Container(
                    margin: EdgeInsets.only(left: 5), child: Text(content)),
              ],
            )),
            Container(
                margin: EdgeInsets.only(right: 10),
                child: Image.asset(
                  ImageUtils.getImagePath('icons/anb'),
                  fit: BoxFit.fill,
                  width: _imageSize,
                  height: _imageSize,
                )),
          ],
        ),
      ),
    );
  }

  //输入框类型
  Widget _createTextFieldType(BuildContext context) {
    return Container(
      height: ScreenUtil.instance.setHeight(150),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 10),
            child: Image.asset(ImageUtils.getImagePath('icons/adg'),
                fit: BoxFit.fill, width: _imageSize, height: _imageSize),
          ),
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color(0xffededed)),
            child: Row(
              children: <Widget>[
                Container(
                  child: Image.asset(ImageUtils.getImagePath('main/apj'),
                      fit: BoxFit.fill, width: _imageSize, height: _imageSize),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                ),
                Expanded(
                    child: Container(
                  height: ScreenUtil.instance.setHeight(150),
                  child: searchType == SearchType.SEARCH_RESULT_TYPE
                      ? _createSearchContentWidget(content)
                      : _createTextFieldWidget(context, content),
                )),
                Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Consumer<SearchProviderModel>(
                      builder: (context, SearchProviderModel model, child) {
                        return _toggleIcon(context,model.showClearIcon);
                      },
                    ))
              ],
            ),
          )),
          Offstage(
              offstage: searchType == SearchType.SEARCH_RESULT_TYPE,
              child: Container(
                padding: EdgeInsets.only(left: 10),
                child: Text('搜索',
                    style: TextStyle(
                        color: ColorConstant.text_gray, fontSize: 18)),
              )),
        ],
      ),
    );
  }

  Widget _toggleIcon(context,bool showClear) {
    Widget iconWidget;
    if (showClear) {
      iconWidget =  GestureDetector(
        onTap: (){
         controller.clear();
         Provider.of<SearchProviderModel>(context).showClearIcon =false;
         },
        child: SvgPicture.asset(ImageUtils.getSvgImagePath('clear'),
            fit: BoxFit.fill, width: _imageSize, height: _imageSize),
      );


    } else {
      iconWidget = Image.asset(
        ImageUtils.getImagePath('icons/anb'),
        fit: BoxFit.fill,
        width: _imageSize,
        height: _imageSize,
      );
    }

    return iconWidget;
  }

  Widget _createTextFieldWidget(BuildContext context, String hintText) {
    return TextField(
      onChanged: (text) {
        Provider.of<SearchProviderModel>(context).showClearIcon =text.isNotEmpty;
        /*  if(text.isNotEmpty && text.length ==1){

          Provider.of<SearchProviderModel>(context).showClearIcon = text.isNotEmpty;
        }else if(text.isEmpty){
          Provider.of<SearchProviderModel>(context).showClearIcon = false;
        }*/
      },
      controller: controller,
      decoration: InputDecoration(
          hintStyle: TextStyle(fontSize: 14),
          hintText: hintText,
          border: InputBorder.none),
      textInputAction: TextInputAction.search,
    );
  }

  Widget _createSearchContentWidget(String content) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Wrap(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
            decoration: BoxDecoration(
              color: Color(0xff959595),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text('$content ×',
                style: TextStyle(color: Colors.white, fontSize: 12)),
          ),
        ],
      ),
    );
  }
}

enum SearchType { ONLY_SHOW_TYPE, SEARCH_TYPE, SEARCH_RESULT_TYPE }
