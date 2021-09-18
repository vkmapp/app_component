import 'package:app_component/routes/route_helper.dart';
import 'package:app_component/routes/router.dart';
import 'package:app_component/routes/routes.dart';
import 'package:flutter/material.dart';

Navigator localNavigator() => Navigator(
      key: baseNavigator.navigatorKey,
      onGenerateRoute: generateRoute,
      initialRoute: overviewPageRoute,
    );
