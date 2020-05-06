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
  static String convertPrice(int price) {
    String result = (price / 100).toString();

    //如果小数点后只有1位,且为 0
    if (result.endsWith('.0')) {
      return result.substring(0, result.lastIndexOf('.'));
    }

    return result;
  }

  //转换毫秒 到 时分秒
  static convertMillisecond(int millisecond) {
    int millis = 1;
    int seconds = 1000 * millis;
    int minutes = 60 * seconds;
    int hours = 60 * minutes;
    int days = 24 * hours;
    String date = '';

//    if(millisecond/days>=1){
//      //天
//      date +='${(millisecond/days).toInt()}:';
//
//    }

    if (millisecond % days / hours >= 1) {
      //小时
      date += '${(millisecond % days / hours).toInt()}:';
    }

    if (millisecond % days % hours / minutes >= 1) {
      //分钟
      date += '${(millisecond % days % hours / minutes).toInt()}:';
    } else {
      date += '00';
    }

    if (millisecond % days % hours % minutes / seconds >= 1) {
      //秒
      date += '${(millisecond % days % hours % minutes / seconds).toInt()}';
    } else {
      date += '00';
    }

//    if(millisecond%days%hours%minutes%seconds/millis>=1){
//      //毫秒
//      date+='${(millisecond%days%hours%minutes%seconds/millis)}';
//    }
    return date;
  }
}
