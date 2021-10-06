import 'package:app_component/provider/data/profile_list_widget.dart';
import 'package:app_component/provider/data/user_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ServicePage extends StatelessWidget {
  const ServicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.cyan,
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileListWidget()),
            );
          },
          child: Text('Load Profile Widget'),
        ),
      ),
    );
  }
}

/*
MultiProvider(providers: [
    //const MyApp()
    ChangeNotifierProvider.value(value: getIt<CollectionDataProvider>()),
    ChangeNotifierProvider.value(value: getIt<UserDataProvider>()),
  ]
 */
