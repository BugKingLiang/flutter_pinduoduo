

import 'package:fluro/fluro.dart';
import 'package:pingduoduo/router/router_handler.dart';

class Routes{


  static String root = '/';
  static String search_page =  '/search_page';
  static String search_resout_page = '/search_resout_page';
  static String subsidy_page = '/subsidy_page';   //百亿补贴页面
  static String goods_detail = '/goods_detail';   //商品详情


  static void configureRouter(FluroRouter router){

    router.define(search_page, handler: search_handler);
    router.define(search_resout_page, handler: search_result_handler);
    router.define(subsidy_page, handler: subsidy_handler);
    router.define(goods_detail, handler: goods_detail_handler);



  }

}