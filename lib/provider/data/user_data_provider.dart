import 'dart:convert';

import 'package:app_component/provider/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserDataProvider with ChangeNotifier {
  /// List user model
  List<UserModel>? _listUserModel = [];
  List<UserModel>? get listUserModel => _listUserModel;

  /// fetch Data
  Future fetchData() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      _listUserModel =
          jsonResponse.map((data) => UserModel.fromJson(data)).toList();
      print('..name..${_listUserModel![0].name}');
      notifyListeners();

    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  /// fetch Data
  Future fetchDataSort() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      var userModel =
          jsonResponse.map((data) => UserModel.fromJson(data)).toList();

      _listUserModel = userModel.reversed.toList();
      print('..name..${_listUserModel![0].name}');
      notifyListeners();

    } else {
      throw Exception('Unexpected error occured!');
    }
  }
}
