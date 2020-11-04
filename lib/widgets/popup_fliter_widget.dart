import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopupFliterWidget {
  OverlayEntry overlayEntry;

  bool isShow = false;
  double _top;
  var priceRange = [
    '0 - 6',
    '6 - 430',
    '430 - 800',
    '800以上',
  ];

  var services = ['退货包运费', '顺丰包邮', '正品发票'];
  var brand = ['华为', 'vivo', '荣耀', 'OPPO', '魅族', '苹果', '小米', '联想'];
  var screenSize = ['4.7英寸及以下', '5.5-5.9英寸', '5.9英寸及以上'];
  var storageSpace = ['64-128G', '256GB以上'];
  var ramSpace = ['4GB', '6GB', '8G及以上'];
  var battery = ['2000mAh-3499mAh', '3500mAh及以上'];
  var afterCamera = ['全网通4G', '移动4G+', '移动联通4G'];
  var nfc = ['支持', '不支持'];

  PopupFliterWidget() {
    _build();
  }

  void _build() {
    overlayEntry = OverlayEntry(builder: (context) {
      return Material(
        color: Colors.transparent,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Listener(
                  child: Container(height: _top),
                  onPointerDown: (event) {
                    dismiss();
                  },behavior: HitTestBehavior.opaque,
                  ),
              Container(
                  color: Colors.white,
                  height: ScreenUtil().setHeight(900),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: CustomScrollView(
                          physics: BouncingScrollPhysics(),
                          slivers: <Widget>[
                            _createItemWidget('价格区间(元)', priceRange,
                                _createPriceCustomeRangeWidget()),
                            _createItemWidget('精选服务', services, null),
                            _createItemWidget('品牌', brand, null),
                            _createItemWidget('屏幕尺寸', screenSize, null),
                            _createItemWidget('储存空间', storageSpace, null),
                            _createItemWidget('运行内存', ramSpace, null),
                            _createItemWidget('电池容量', battery, null),
                            _createItemWidget('后置摄像头', afterCamera, null),
                            _createItemWidget('NFC模式', nfc, null),
                          ],
                        ),
                      ),
                      Container(
                        height: ScreenUtil().setHeight(120),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Expanded(
                                child: RaisedButton(
                              onPressed: () {},
                              child: Text('重置'),
                              color: Colors.white,
                              elevation: 0,
                              highlightElevation: 0,
                              focusColor: Colors.red,
                            )),
                            Expanded(
                                child: RaisedButton(
                                    onPressed: () {},
                                    child: Text('完成'),
                                    color: Color(0xffe02e24),
                                    elevation: 0,
                                    highlightElevation: 0,
                                    textColor: Colors.white)),
                          ],
                        ),
                      )
                    ],
                  )),
              Expanded(
                  child: GestureDetector(
                      onTap: () {
                        dismiss();
                      },
                      child: Container(color: Colors.black.withOpacity(0.6))))
            ],
          ),
        ),
      );
    });
  }

  Widget _createItemWidget(String title, List<String> data, Widget child) {
    var widget = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
            padding: EdgeInsets.symmetric(vertical: 8),
            alignment: Alignment.centerLeft,
            child: Text(title,
                style: TextStyle(color: Color(0xff9c9c9c), fontSize: 14))),
        GridView.builder(
            padding: EdgeInsets.all(0),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, childAspectRatio: 2, crossAxisSpacing: 10,mainAxisSpacing: 10),
            itemCount: data.length,
            itemBuilder: (_, index) {
              return RaisedButton(
                onPressed: () {},
                child: Text(data[index]),
                color: Color(0xfff8f8f8),
                elevation: 0,
                highlightElevation: 0,
              );
            }),
        Offstage(
          offstage: child == null,
          child: child,
        )
      ],
    );

    return SliverPadding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        sliver: SliverToBoxAdapter(child: widget));
  }

  Widget _createPriceCustomeRangeWidget() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
              child: Container(
            height: ScreenUtil().setHeight(120),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xfff8f8f8)),
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  hintStyle: TextStyle(fontSize: 14),
                  hintText: '最低价',
                  border: InputBorder.none),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
            ),
          )),
          Container(
            width: ScreenUtil().setWidth(100),
            child: Divider(
              height: 1,
              thickness: 1,
            ),
            margin: EdgeInsets.symmetric(horizontal: 10),
          ),
          Expanded(
              child: Container(
                height: ScreenUtil().setHeight(120),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xfff8f8f8)),
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintStyle: TextStyle(fontSize: 14),
                      hintText: '最高价',
                      border: InputBorder.none),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                ),
              )),
        ],
      ),
    );
  }

  void show(GlobalKey key) {
    if (!isShow) {
      Rect rect = getWidgetGlobalRect(key);

      _top = rect.bottom;
      isShow = true;
      Overlay.of(key.currentContext).insert(overlayEntry);
    }
  }

  void dismiss() {
    if (isShow) {
      isShow = false;
      overlayEntry.remove();
    }
  }

  Rect getWidgetGlobalRect(GlobalKey key) {
    RenderBox renderBox = key.currentContext.findRenderObject();
    var offset = renderBox.localToGlobal(Offset.zero);
    return Rect.fromLTWH(
        offset.dx, offset.dy, renderBox.size.width, renderBox.size.height);
  }
}
