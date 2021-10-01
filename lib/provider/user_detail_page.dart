import 'package:app_component/provider/model/user_model.dart';
import 'package:flutter/material.dart';

class UserDetailPage extends StatelessWidget {
  const UserDetailPage({Key? key, required this.user}) : super(key: key);

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Text('${user.name}')],
      ),
    );
  }
}
