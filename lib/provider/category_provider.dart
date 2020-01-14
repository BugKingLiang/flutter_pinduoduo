import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pingduoduo/http/api.dart';

class CategoryProvider with ChangeNotifier{

  String _id = '0';
  String get id => _id;

  var data;


  void onChangeId(String id){
    _id = id;
    notifyListeners();


  }

}