import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:pingduoduo/pages/goods_detail/goods_detail_page.dart';
import 'package:pingduoduo/pages/search/search_page.dart';
import 'package:pingduoduo/pages/search/search_result_page.dart';
import 'package:pingduoduo/pages/subsidy/subsidy_page.dart';

var search_handler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return SearchPage();
});


var search_result_handler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {

      return SearchResoutPage(params['key'].first);
    });

var subsidy_handler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {

      return SubsidyPage();
    });

var goods_detail_handler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {

      return GoodsDetailPage();
    });