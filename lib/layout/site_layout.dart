import 'package:app_component/layout/mob/mob_layout.dart';
import 'package:app_component/layout/response_builder.dart';
import 'package:app_component/layout/web/web_layout.dart';
import 'package:flutter/material.dart';

class BaseLayout extends StatelessWidget {
  const BaseLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.brown,
      ),
      body: const ResponseBuilder(
        largeScreen: WebLayout(),
        smallScreen: MobLayout(),
      ),
    );
  }
}
