import 'package:app_component/routes/local_navigator.dart';
import 'package:flutter/material.dart';

class MobLayout extends StatelessWidget {
  const MobLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return localNavigator();
  }
}
