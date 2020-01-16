import 'package:flutter/material.dart';
import 'package:pingduoduo/bean/flow_tag_bean.dart';


class SearchProviderModel with ChangeNotifier{


  List<Map<FlowTagBean,List<FlowTagBean>>> _data;

  Map<FlowTagBean,List<FlowTagBean>> _historyData;//历史数据
  Map<FlowTagBean,List<FlowTagBean>> _moreFindData;//更多搜索方式
  Map<FlowTagBean,List<FlowTagBean>> _recommendData;//搜索发现


  SearchProviderModel(this._data);


//  List<Map<FlowTagBean, List<FlowTagBean>>> get data => _data;
  List<Map<FlowTagBean, List<FlowTagBean>>> get data => _data.where((map){
    var every = map.values.every((v){return v.isNotEmpty;});
    return every;
  }).toList();




  //删除历史数据
  void removeHistorySearch(int index,FlowTagBean key,int removeIndex){

    _data[index][key].removeAt(removeIndex);

    notifyListeners();

  }

  //过滤调空数据
  void _fliterEmptData(){


    var result = _data.where((map){
      var every = map.values.every((v){return v.isNotEmpty;});
      return every;
    }).toList();
    print(result);



  }



}