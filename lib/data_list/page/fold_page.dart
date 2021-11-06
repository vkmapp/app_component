import 'package:flutter/material.dart';
import 'package:app_component/data_list/data/bikes.dart';
import 'package:app_component/data_list/widget/value_widget.dart';

class FoldPage extends StatefulWidget {
  @override
  _FoldPageState createState() => _FoldPageState();
}

class _FoldPageState extends State<FoldPage> {
  @override
  Widget build(BuildContext context) {
    final initialValue = 0;
    final totalHorsePower = bikes.fold<int>(
      initialValue,
      (previous, value) => previous + value.horsepower,
    );

    return Center(
      child: ValueWidget(
        title: 'Total Horsepower',
        value: '$totalHorsePower',
      ),
    );
  }
}
