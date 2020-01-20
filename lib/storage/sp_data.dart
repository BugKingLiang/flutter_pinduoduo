
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


  void addSearchHistory(String history) async {
    var sp = await SharedPreferences.getInstance();
    var historyList = sp.getStringList('search_history');
    if(historyList != null && !historyList.contains(history)){
      //去重
      historyList?.add(history);

    }
      sp.setStringList('search_history', historyList == null?[history]:historyList);




  }

  Future<List<String>> getSearchHistory() async {
    var sp = await SharedPreferences.getInstance();
    return sp.getStringList('search_history');
  }

  Future<bool> removeSearchHistory(String history)async{

    var sp = await SharedPreferences.getInstance();
    //从历史列表中删除
    var historyList = sp.getStringList('search_history');
    var result = historyList?.remove(history);
    //更新历史列表
    sp.setStringList('search_history', historyList);

    return   result;

  }


}
