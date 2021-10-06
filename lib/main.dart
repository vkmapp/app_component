import 'package:app_component/provider/collections_data_provider.dart';
import 'package:app_component/provider/data/user_data_provider.dart';
import 'package:app_component/provider/json_data_class.dart';
import 'package:app_component/widgets/_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'layout/site_layout.dart';

/// This is our global ServiceLocator
GetIt getIt = GetIt.instance;

/// Locator
void getItLocator(){
  getIt.registerSingleton(JsonDataClass());
  getIt.registerSingleton(CollectionDataProvider());
  getIt.registerSingleton(UserDataProvider());
}

void main() {
  /// getIt locator
  getItLocator();

  /// Run App
  runApp(MultiProvider(providers: [
    //const MyApp()
    ChangeNotifierProvider.value(value: getIt<CollectionDataProvider>()),
    ChangeNotifierProvider.value(value: getIt<UserDataProvider>()),
    FutureProvider.value(value: getIt<UserDataProvider>().fetchData(), initialData: {}),
  ], child: const MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widgets',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BaseLayout(),

      ///const ClockPage(),
    );
  }
}

/// Home Page
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: const [
              OTPWidget(),
              ClockPage(),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
