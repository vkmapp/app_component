import 'package:app_component/routes/local_navigator.dart';
import 'package:app_component/routes/route_helper.dart';
import 'package:app_component/routes/routes.dart';
import 'package:flutter/material.dart';

class WebLayout extends StatelessWidget {
  const WebLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            color: Colors.blueGrey,
            child: ListView(
              children: [
                ListTile(
                  title: const Text('About Page'),
                  onTap: () {
                    baseNavigator.navigateTo(overviewPageRoute);
                  },
                ),
                ListTile(
                  title: const Text('Contact Page'),
                  onTap: () {
                    baseNavigator.navigateTo(driversPageRoute);
                  }
                  ,
                ),
                ListTile(
                  title: const Text('Home Page'),
                  onTap: () {
                    baseNavigator.navigateTo(clientsPageRoute);
                  },
                ),
                ListTile(
                  title: const Text('Service Page'),
                  onTap: () {
                    baseNavigator.navigateTo(authenticationPageRoute);
                  },
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: localNavigator(),
          flex: 5,
        ),
      ],
    );
  }
}
