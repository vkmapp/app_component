import 'package:flutter/material.dart';
import 'package:app_component/data_list/data/bikes.dart';
import 'package:app_component/data_list/widget/value_widget.dart';

class ExpandPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bikesMoreHorsepower = bikes
        .expand((bike) => [bike.horsepower, bike.horsepower + 100])
        .toList();

    return Center(
      child: ValueWidget(
        title: 'Expanded List',
        value: bikesMoreHorsepower.join(', '),
      ),
    );
  }
}
