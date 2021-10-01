import 'package:app_component/pages/_page.dart';
import 'package:app_component/provider/provider_main.dart';
import 'package:app_component/provider/provider_page.dart';
import 'package:flutter/material.dart';

import 'routes.dart';

/// Route generate
Route<dynamic> generateRoute(RouteSettings settings){
  switch (settings.name) {
    case overviewPageRoute:
      return _getPageRoute(ProviderMain());//AboutPage());
    case driversPageRoute:
      return _getPageRoute(const ContactPage());
    case clientsPageRoute:
      return _getPageRoute(const HomePage());
    default:
      return _getPageRoute(const ServicePage());
  }
}

/// Get Page Route
PageRoute _getPageRoute(Widget child){
  return MaterialPageRoute(builder: (context) => child);
}