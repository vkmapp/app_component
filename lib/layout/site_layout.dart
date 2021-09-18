import 'package:app_component/layout/mob/mob_layout.dart';
import 'package:app_component/layout/response_builder.dart';
import 'package:app_component/layout/web/web_layout.dart';
import 'package:app_component/routes/route_helper.dart';
import 'package:app_component/routes/routes.dart';
import 'package:flutter/material.dart';

class BaseLayout extends StatelessWidget {
  const BaseLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.brown,
        actions: [
          TextButton(
            onPressed: () {
              baseNavigator.navigateTo(overviewPageRoute);
            },
            child: const Text('About'),
          ),
          TextButton(
              onPressed: () {
                baseNavigator.navigateTo(driversPageRoute);
              },
              child: const Text('Contact')),
          TextButton(
              onPressed: () {
                baseNavigator.navigateTo(clientsPageRoute);
              },
              child: const Text('Home')),
          TextButton(
              onPressed: () {
                baseNavigator.navigateTo(authenticationPageRoute);
              },
              child: const Text('Service'))
        ],
      ),
      body: const ResponseBuilder(
        largeScreen: WebLayout(),
        smallScreen: MobLayout(),
      ),
    );
  }
}
