import 'package:app_component/provider/json_data_class.dart';
import 'package:app_component/provider/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureProvider(
      create: (context) => context.read<JsonDataClass>().getUsersList(),
      initialData: 'Loading....',
      child: Container(
        child: Consumer<UserModel>(
          builder: (context,myModel,child){
            return Text('Job is ${myModel.name}.',style: TextStyle(fontSize: 24));
          },
        ),
      ),
    );
  }
}
/*
FutureProvider.value(initialData: null, value: provider.method())
 */
