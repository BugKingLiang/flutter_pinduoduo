import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pingduoduo/router/router.dart';
import 'package:pingduoduo/util/color_constant.dart';
import 'package:pingduoduo/util/image_utls.dart';

import '../Application.dart';

//搜索框的样式

class SearchWidget extends StatefulWidget {
  Color bgColor;

  String content;
  SearchType searchType;
  TextEditingController controller;

  SearchWidget(this.content,
      {this.bgColor = Colors.white,
      this.searchType = SearchType.ONLY_SHOW_TYPE,
      this.controller});

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  double _imageSize;

  bool _showClearIcon = false;

  @override
  Widget build(BuildContext context) {
    _imageSize = ScreenUtil().setWidth(60);

    switch (widget.searchType) {
      case SearchType.SEARCH_RESULT_TYPE:
      case SearchType.SEARCH_TYPE:
        return _createTextFieldType(context);

      default:
        return _createTabarShowType(context);
    }
  }
  @override
  void dispose() {
    super.dispose();
    widget.controller?.dispose();
  }

  Widget _createTabarShowType(BuildContext context) {
    return Container(
      color: widget.bgColor,
      padding: EdgeInsets.all(10),
      child: Container(
        height: ScreenUtil().setHeight(100),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3), color: Color(0xffededed)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: Listener(
                  onPointerDown: (event) {
                    Application.router.navigateTo(context, Routes.search_page,
                        transition: TransitionType.fadeIn);
                  },
                  behavior: HitTestBehavior.opaque,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(ImageUtils.getImagePath('main/apj'),
                          fit: BoxFit.fill,
                          width: _imageSize,
                          height: _imageSize),
                      Container(
                          margin: EdgeInsets.only(left: 5),
                          child: Text(widget.content)),
                    ],
                  ),
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
      height: ScreenUtil().setHeight(150),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Row(
        children: <Widget>[
          Listener(
            onPointerDown: (event){

              Application.router.pop(context);

            },
            behavior: HitTestBehavior.opaque,
            child: Container(
              padding: EdgeInsets.only(right: 10),
              child: Image.asset(ImageUtils.getImagePath('icons/adg'),
                  fit: BoxFit.fill, width: _imageSize, height: _imageSize),
            ),
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
                  height: ScreenUtil().setHeight(150),
                  child: widget.searchType == SearchType.SEARCH_RESULT_TYPE
                      ? _createSearchContentWidget(widget.content)
                      : _createTextFieldWidget(context, widget.content),
                )),
                Container(
                    margin: EdgeInsets.only(right: 10),
                    child: _toggleIcon(context, _showClearIcon))
              ],
            ),
          )),
          Offstage(
              offstage: widget.searchType == SearchType.SEARCH_RESULT_TYPE,
              child: GestureDetector(
                onTap: (){
                  Application.router.navigateTo(context, Routes.search_resout_page,transition: TransitionType.cupertino);
                },
                child: Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Text('搜索',
                      style: TextStyle(
                          color: ColorConstant.text_gray, fontSize: 18)),
                ),
              )),
        ],
      ),
    );
  }

  Widget _toggleIcon(context, bool showClear) {
    Widget iconWidget;
    if (showClear) {
      iconWidget = GestureDetector(
        onTap: () {
          //清除点击事件
          widget.controller.clear();
          setState(() {
            _showClearIcon = false;
          });
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
        setState(() {
          _showClearIcon = text.isNotEmpty;
        });
      },
      controller: widget.controller,
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
