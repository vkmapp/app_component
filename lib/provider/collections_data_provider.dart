import 'package:flutter/material.dart';

class CollectionDataProvider with ChangeNotifier {
  List<String> _arrayList = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];

  /// Result
  String get arrayLength => _arrayList.length.toString();
  List<String> get result => _arrayList;

  /// Add item in array list
  void addItem(){
    _arrayList.add('value 1');
    notifyListeners();
  }
}
