
//单例模式
import 'package:shared_preferences/shared_preferences.dart';

class SPUtils {


  factory SPUtils() => _getInstance();

  static SPUtils get instance => _getInstance();
  static SPUtils _instance;

  SPUtils._internal() {
    // 初始化
  }

  static SPUtils _getInstance() {
    if (_instance == null) {
      _instance = new SPUtils._internal();
    }
    return _instance;
  }


  void putSearchHistory(String history) async {
    var sp = await SharedPreferences.getInstance();
    var stringList = sp.getStringList('search_history');
    stringList?.add(history);
    sp.setStringList('search_history', stringList == null?[history]:stringList);

  }

  Future<List<String>> getSearchHistory() async {
    var sp = await SharedPreferences.getInstance();
    return sp.getStringList('search_history');
  }

}
