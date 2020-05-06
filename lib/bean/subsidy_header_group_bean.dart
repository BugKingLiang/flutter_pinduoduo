
class SubsidyHeaderGroupBean {

  String title;
  String imaegUrl;
  int milliSecond;
  List<String> nearBuyImage;
  String saleNumber;
  String price;
  String _timer;

  SubsidyHeaderGroupBean({this.title, this.imaegUrl, this.milliSecond,
      this.nearBuyImage, this.saleNumber, this.price});

  String get timer => _timer;

  set timer(String value) {
    _timer = value;
  }


}