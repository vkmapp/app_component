import 'package:flutter/material.dart';
import 'package:app_component/data_list/data/cars.dart';
import 'package:app_component/data_list/widget/value_widget.dart';

class ContainsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final hasLamborghini = cars.contains('Lamborghini');

    return Center(
      child: hasLamborghini
          ? ValueWidget(title: 'Best Sports Car', value: 'Lamborghini')
          : ValueWidget(title: 'Best Sports Car', value: 'None'),
    );
  }
}
