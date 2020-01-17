import 'dart:convert';

import 'package:dio/dio.dart';

import '../mock_data.dart';

typedef RequestCallBack<T> = void Function(T value);

class Api {
  Dio _dio;

  factory Api() => _getInstance();

  static Api get instance => _getInstance();
  static Api _instance;

  Api._intermal() {
    _dio = Dio();

//    _dio.options.baseUrl = 'http://mobile.yangkeduo.com/proxy';
    _dio.options.connectTimeout = 5000;
    _dio.options.receiveTimeout = 5000;
  }

  static Api _getInstance() {
    if (_instance == null) {
      _instance = new Api._intermal();
    }

    return _instance;
  }

  Future<Response> requestHomeData(int page, {int size = 20}) async {
    return await _dio.get(
        'http://mobile.yangkeduo.com/proxy/api/api/alexa/goods/hub?list_update_time=true&platform=1&assist_allowed=1&hs_version=2&list_id=huTNkHdMM0&antiContent=0anAfxnUXyloU9EwDrlUEjhEXaS7g44YiUXMdbyVeKP9Fd__XTvkAFCfYaRo4tshzH7G6YY7re1W998NxT8bj3c2T0z9w1S8nEww84BFScpK4xGtNOlrYCDw7eVNIfdr_EMrqxy9E3w_w19hVKCWmPbYcIdguqy6Xk35h4Lo-B75cHf5y6fKWTUnsg_PThC91dBxxLF43BUs26FxFigohvFB0l-bhxMV4lY-FOe57yESJ-1sEf8lt2_WTpb7VHpjZ3Vc07djkk3aIYH7cm3aKGTkqq_FptEJecnnI6NlGI5aQBSu9_V0-h57FgENk_ZC_bOF8cg4NokN4W2HPln7ZKrIiDGhPyhU8zAtOhq44vm4KWJs9AR7i2ac957i-rX6DwLDdjGzBEY8dyuhb1cfZHq-pygRA_eLjuhChd0WbaQO--h1cynizRLBjmWDbP&pdduid=0',
        queryParameters: {'page': page, 'size': '$size'});
  }

  //推荐数据,offset 从20,开始,每次都是×2倍增,40,60,80 .....
  Future<Response> requestRemmonedData(String offset) async {
    String requestUrl =
        'http://yangkeduo.com/proxy/api/api/barrow/query?pdduid=0&app_name=rectab_sim_gyl&support_types=0_1&count=20&list_id=SEWLYHQHqM&dp_list_id=SEWLYHQHqM_dp';

    return await _dio.get(requestUrl, queryParameters: {'offset': offset});
  }

  //大分类对应的小分类请求
  Future<Object> requestCategoryData(String id) async {
    String requestUrl =
        'http://yangkeduo.com/proxy/api/api/search/operation/detail/group?pdduid=0&link_id=ac64b25e-a16c-4249-b428-1674ccc9e655&anti_content=0aoAfxnUmNIyg9maDrL1aTwK2u2TzggU_8defffXSFFUuj3znyuzj5vyUcEqdojJYJ-jWxCjv3rAQWCYpR4QrZRw74V6MIoJlM2JRQAJDYA9t9w8gQnfTP7ozRSoiJcNfsEosAY_INUpvliHlYnnrcvsByVfdvcfbI7OdKvoVOvB4OImhjxU1-HJKPhezaJGSWt4nUNcig1X7TPPzLHiPobqP8rUQSU6IhOp4Jc8bRf-82OI-B9cYVMWd4RiO0L9diTUSru3UkdAHw5GCcENRx3G34ws8SlLt2HYEmL9gNwIMgU72g-ZWwJU9C8_slQ_UKKTMUTXZKpcP8z_mNHbEKheTuy3iY9QigLkc_8A7BFOlkjDagr-4MpuCuJegwvtPs0ZaqCgNvf5vYrDKdzNh6ftjSb5PwlE2668ml5HOpxSyaXvzQLFsUYoPQKYuFrOSiyzUMrzZkIECrWeFzw_bHaZyCY06oIPMVAGf_zif_MhsfRoL4Qnh7Ch2_VrWXG7_3LrL7Sp2sMmvYmMLiFLD_mWsPDuYGIqjeGOr8RYoNwFuLRbNFo4bdOo4QgjoA63ZZHQy2jlMFqg_L6PalKu3QFmQC6vA_McT';

    if (id == '0') {
      return await Future.delayed(Duration(seconds: 1), () {
        return json.decode(MockData.category_recommend);
      });
    }

    return await _dio.get(requestUrl, queryParameters: {'opt_id': id});
  }

  //右边分类,商品列表
  Future requestCategoryGroupData() async {
    return await Future.delayed(Duration(seconds: 2), () {
      return json.decode(MockData.category_right_goods_data);
    });
  }

//推荐数据
  Future<Response> requestRcommendData(int offset) async {
    return await _dio.get(
        'http://yangkeduo.com/proxy/api/api/barrow/query?pdduid=4245542673668&app_name=rectab_sim_gyl&support_types=0_1&count=20&list_id=lBGKPa7lz6&dp_list_id=lBGKPa7lz6_dp',
        queryParameters: {'offset': '${offset}'});
  }

  //个人中推荐数据
  Future<Response> requestPersonRecommendData(int offset)async{
    return await _dio.get('http://yangkeduo.com/proxy/api/api/barrow/query?pdduid=4245542673668&is_back=1&count=20&list_id=rec_list_personal_l6j1xn&app_name=personal',
        queryParameters: {'offset': '${offset}'});


  }
  //消息页面推荐数据
  Future<Response> requestMessageRecommendData(int offset)async{

    return await _dio.get('http://yangkeduo.com/proxy/api/api/barrow/query?pdduid=4245542673668&count=20&app_name=new_chat_list&list_id=chat_list_rec_list_wR0pFR',
        queryParameters: {'offset': '${offset}'});


  }

}
