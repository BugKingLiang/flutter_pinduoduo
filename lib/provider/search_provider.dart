import 'package:flutter/material.dart';
import 'package:pingduoduo/storage/mock_data.dart';

class SearchProviderModel<T> with ChangeNotifier {



  List _searchSuggets;//搜索建议


  List<Map<T, List<T>>> _data = List();
  Map<T, List<T>> _historyData = Map(); //历史数据
  Map<T, List<T>> _moreFindData = Map(); //更多搜索方式
  Map<T, List<T>> _recommendData = Map(); //搜索发现

  SearchProviderModel.init(
      Map<T, List<T>> moreFindData, Map<T, List<T>> recommendData,Map<T, List<T>> historyData) {
    _historyData.addAll(historyData);
    _moreFindData.addAll(moreFindData);
    _recommendData.addAll(recommendData);

    _data.add(_historyData);
    _data.add(_moreFindData);
    _data.add(_recommendData);
  }


  List get searchSuggets => _searchSuggets;

  set searchSuggets(List value) {
    _searchSuggets = value;
    notifyListeners();
  }

  //清空历史数据
  void clearSearchSuggets(){
    _searchSuggets?.clear();
//    notifyListeners();
  }

  //过滤掉,空数据
  List<Map<T, List<T>>> get data => _data.where((map) {
        var every = map.values.every((v) {
          return v.isNotEmpty;
        });
        return every;
      }).toList();


  //删除历史数据
  void removeHistorySearch(T key, int index) {
    if (_historyData != null && _historyData[key].isNotEmpty) {
      //必须有历史数据

      _historyData[key].removeAt(index);
      notifyListeners();

    }
  }

   void  addListHistoryData(List<T> datas){
    _historyData[MockData.search_history_key].addAll(datas);
    notifyListeners();

  }
  //增加历史搜索
  void addHistory(T data){

    _historyData.values.map((v){
      v.insert(0, data);
    });

    //notifyListeners();





  }


}
