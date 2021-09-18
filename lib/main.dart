import 'package:app_component/widgets/_widgets.dart';
import 'package:flutter/material.dart';
import 'package:otp_pin_field/otp_pin_field.dart';

import 'layout/site_layout.dart';
void main() {
  runApp(const MyApp());
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
      home: const BaseLayout(), ///const ClockPage(),
    );
  }
}

/// Home Page
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: SafeArea(
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
    backgroundColor: Colors.white,);
  }
}


