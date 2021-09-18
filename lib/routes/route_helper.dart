import 'package:flutter/material.dart';

/// Route helper
final baseNavigator = RouteHelper.I;
class RouteHelper {

  static RouteHelper get I => RouteHelper._();

  RouteHelper._();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  Future<dynamic> navigateTo(String routeName){
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  goBack() => navigatorKey.currentState!.pop();
}

