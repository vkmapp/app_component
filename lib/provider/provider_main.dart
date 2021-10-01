import 'package:app_component/provider/collections_data_provider.dart';
import 'package:app_component/provider/provider_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import 'json_data_class.dart';

class ProviderMain extends StatelessWidget {
  const ProviderMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>(); // You need to create this key to control what navigator you want to use


    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: getIt<JsonDataClass>()),

      ],
      child: ProviderPage(),
    );
  }
}
