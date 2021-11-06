import 'package:flutter/material.dart';
import 'package:app_component/data_list/data/cars.dart';
import 'package:app_component/data_list/widget/value_widget.dart';

class ReducePage extends StatefulWidget {
  @override
  _ReducePageState createState() => _ReducePageState();
}

class _ReducePageState extends State<ReducePage> {
  @override
  Widget build(BuildContext context) {
    final joinedCars = cars.reduce((value, element) => '$value & $element');

    return Center(child: ValueWidget(title: 'Joined Cars', value: joinedCars));
  }
}
