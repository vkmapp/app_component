
import 'dart:convert';

import 'package:app_component/provider/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class JsonDataClass with ChangeNotifier {

  //Step 1: Show string
  String _name = 'INIT';
  String get name => _name;

  /// List users
  List<UserModel> _listUsers = [];
  List<UserModel> get resultUsers => _listUsers;


  set name(String value){
    _name = value;
    notifyListeners();
  }

  //Step 2: Read Functions
  /// get data from api
  dynamic fetchData() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      _listUsers =  jsonResponse.map((data) => UserModel.fromJson(data)).toList();
      notifyListeners();
      print(json.encode(_listUsers));
      print(_listUsers[0].name);
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  /// Future provider
  Future<List<UserModel>> getUsersList() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      var _result =  jsonResponse.map((data) => UserModel.fromJson(data)).toList();
      print(json.encode(_result));
      print(_result[0].name);
      return _result;
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

}