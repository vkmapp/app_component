import 'package:app_component/provider/json_data_class.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'collections_data_provider.dart';
class ProviderNextPage extends StatelessWidget {
  const ProviderNextPage({Key? key, this.parentContext}) : super(key: key);

  final BuildContext? parentContext;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Text(parentContext!.watch<JsonDataClass>().name),
            Text(context.watch<CollectionDataProvider>().arrayLength),
            Text('${context.watch<CollectionDataProvider>().result}'),
            ElevatedButton(onPressed: () {
              context.read<CollectionDataProvider>().addItem();
            }, child: Text('Add Item'))
          ],
        ),
      ),
    );
  }
}
