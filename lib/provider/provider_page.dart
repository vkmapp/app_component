import 'dart:convert';

import 'package:app_component/provider/model/user_model.dart';
import 'package:app_component/provider/provider_next_page.dart';
import 'package:app_component/provider/user_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'json_data_class.dart';
import 'list/user_list_widget.dart';

class ProviderPage extends StatelessWidget {
  const ProviderPage({Key? key}) : super(key: key);

  /// Update value changes
  void dataUpdate(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () {
      context.read<JsonDataClass>().name = 'WELCOME';
    });
  }

  @override
  Widget build(BuildContext context) {
    /// Init load
    if (context.read<JsonDataClass>().name == 'INIT') {
      dataUpdate(context);
    }

    /// Select
    final valueThatNeverChange =
        context.select((JsonDataClass data) => data.name);

    print('REBUILD');

    return Container(
      child: Column(
        children: [
          Text(context.watch<JsonDataClass>().name),
          Text(valueThatNeverChange),
          ElevatedButton(
            onPressed: () {
              context.read<JsonDataClass>().name = 'CLICK';
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProviderNextPage(
                    parentContext: context,
                  ),
                ),
              );
            },
            child: Text('Update'),
          ),
          MaterialButton(
            onPressed: () {
              context.read<JsonDataClass>().fetchData();
            },
            child: Text('Basic Api Call'),
          ),
          //Expanded(child: UserList()),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return listTileContainer(
                  context,
                  context.watch<JsonDataClass>().resultUsers[index],
                );
              },
              itemCount: context.watch<JsonDataClass>().resultUsers.length,
            ),
          ),

        ],
      ),
    );
  }

  Widget listTileContainer(BuildContext context, UserModel user) {
    return ListTile(
      leading: CircleAvatar(),
      title: Text('${user.name}'),
      trailing: Icon(Icons.arrow_forward_ios_sharp),
      onTap: () {
        print(json.encode(user));

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => UserDetailPage(
              user: user,
            ),
          ),
        );
      },
    );
  }
}
