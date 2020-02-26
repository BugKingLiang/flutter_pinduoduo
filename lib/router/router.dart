

import 'package:fluro/fluro.dart';
import 'package:pingduoduo/router/router_handler.dart';

class Routes{


  static String root = '/';
  static String search_page =  '/search_page';
  static String search_resout_page = '/search_resout_page';

  static void configureRouter(Router router){

    router.define(search_page, handler: search_handler);
    router.define(search_resout_page, handler: search_result_handler);


  }

}