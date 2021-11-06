import 'package:flutter/material.dart';
import 'package:app_component/data_list/data/bikes.dart';
import 'package:app_component/data_list/widget/value_widget.dart';

class EveryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isHighHorsepower = bikes.every((bike) => bike.horsepower >= 2000);

    return Center(
      child: ValueWidget(
        title: 'All High Horsepower?',
        value: isHighHorsepower.toString(),
      ),
    );
  }
}
