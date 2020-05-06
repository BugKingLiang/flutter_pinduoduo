import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pingduoduo/bean/subsidy_header_group_bean.dart';
import 'package:pingduoduo/storage/mock_data.dart';
import 'package:pingduoduo/util/utils.dart';

//倒计时管理
class CountDownProvider with ChangeNotifier {
  Timer _timer;
  List<SubsidyHeaderGroupBean> subsidyHeaderData = List();

  CountDownProvider() {
    subsidyHeaderData.addAll(MockData.subsidyHeaderDatas);
  }

  void countdown() {
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      subsidyHeaderData.forEach((f) {
        if (f.milliSecond > 0) {
          f.timer = Utils.convertMillisecond(f.milliSecond);
          f.milliSecond -= 1000;
        }
      });
      notifyListeners();

      //所有item项的时间都结束了,就终止计时
      if (subsidyHeaderData.every((value) => value.milliSecond <= 0)) {
        cancelTimer();
      }


    });
  }

  void cancelTimer() {
    _timer?.cancel();
  }
}
