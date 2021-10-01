import 'package:app_component/pages/slider/slider_widget.dart';
import 'package:app_component/provider/provider_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ProviderPage(),
    );
  }
}
