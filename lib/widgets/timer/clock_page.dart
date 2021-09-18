import 'package:app_component/widgets/timer/timer_clock_widget.dart';
import 'package:flutter/material.dart';


/// CLOCK Page
class ClockPage extends StatelessWidget {
  const ClockPage({Key? key}) : super(key: key);

  /// Colors
  static const Color kBackground = Color(0xff000000);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: TimerClockWidget()),backgroundColor: kBackground,);
  }
}

