import 'package:app_component/ticker/auto_ticker_widget.dart';
import 'package:app_component/ticker/data.dart';
import 'package:flutter/material.dart';

class TickerPage extends StatefulWidget {
  const TickerPage({Key? key}) : super(key: key);

  @override
  _TickerPageState createState() => _TickerPageState();
}

class _TickerPageState extends State<TickerPage> {
  ScrollController _scrollController1 = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      double minScrollExtent1 = _scrollController1.position.minScrollExtent;
      double maxScrollExtent1 = _scrollController1.position.maxScrollExtent;
      animateToMaxMin(maxScrollExtent1, minScrollExtent1, maxScrollExtent1, 25,
          _scrollController1);
    });
  }

  animateToMaxMin(double max, double min, double direction, int seconds,
      ScrollController scrollController) {
    scrollController
        .animateTo(direction,
            duration: Duration(seconds: seconds), curve: Curves.linear)
        .then((value) {
      direction = direction == max ? min : max;
      animateToMaxMin(max, min, direction, seconds, scrollController);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          AutoTickerWidget(
            scrollController: _scrollController1,
            images: flagsList,
          ),
        ],
      ),
    );
  }
}
