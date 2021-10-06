import 'package:app_component/provider/data/user_data_provider.dart';
import 'package:app_component/provider/model/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileListWidget extends StatefulWidget {
  const ProfileListWidget({Key? key}) : super(key: key);

  @override
  State<ProfileListWidget> createState() => _ProfileListWidgetState();
}

class _ProfileListWidgetState extends State<ProfileListWidget> {
  @override
  Widget build(BuildContext context) {
    var listFromService = context.watch<UserDataProvider>().listUserModel;
    if (listFromService != null) {
      print('......${context.watch<UserDataProvider>().listUserModel!.length}');
    }
    //Text('${context.watch<UserDataProvider>().listUserModel![0].name}')
    return listFromService != null ?  Container( child: loadData(listFromService)
    ) : CircularProgressIndicator();
  }

  Future<void> _refresh() async {
    context.read<UserDataProvider>().fetchDataSort();
  }


  Widget loadData(List<UserModel> users) {
    return RefreshIndicator(
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      //edgeOffset: 0,
      displacement: 100,
      onRefresh: _refresh,
      backgroundColor: Colors.blueGrey,
      child: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, i) {
          var obj = users[i];
          return  ListTile(
            title: Text(obj.name.toString()),
            subtitle: Text(obj.address.toString()),
          );
        },
      ),
    );
  }
}
