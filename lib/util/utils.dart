class Utils {
  //销量转换
  static String calculateSales(int sales) {
    String prefix = '已拼';

    if (sales >= 10000 && sales < 100000) {
      return '$prefix${(sales / 10000).toStringAsFixed(1)}万件';
    } else if (sales >= 100000) {
      return '${prefix}10万+件';
    }
    return '$prefix$sales件';
  }
  //价格转换
  static String convertPrice(int price){

    return (price/100).toStringAsFixed(2);

  }

}
