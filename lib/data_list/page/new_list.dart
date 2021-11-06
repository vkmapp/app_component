import 'package:flutter/material.dart';
import 'package:app_component/data_list/data/bikes.dart';
class NewList extends StatelessWidget {
  const NewList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = <NewListData>[];
    bikes.forEach((element) {
      data.add(NewListData(element.horsepower, element.name));
    });
    return Container(
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, i) {
          return ListTile(
            title: Text(data[i].value),
          );
        },
      ),
    );
  }
}
