import 'package:flutter/material.dart';
class CardWheel extends StatefulWidget {
  const CardWheel({Key? key}) : super(key: key);

  @override
  _CardWheelState createState() => _CardWheelState();
}

class _CardWheelState extends State<CardWheel> {
  double itemWidth = 60.0;
  int itemCount = 100;
  int selected = 50;
  final FixedExtentScrollController _scrollController =
  FixedExtentScrollController(initialItem: 50);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:RotatedBox(
        quarterTurns: -1,
        child: ListWheelScrollView(
          itemExtent: itemWidth,
          magnification: 2.0,
          onSelectedItemChanged: (index) {
            setState(() {
              selected = index;
            });
          },
          controller: _scrollController,
          children: List.generate(
            itemCount,
                (x) => RotatedBox(
              quarterTurns: 1,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                width: x == selected ? 60 : 50,
                height: x == selected ? 60 : 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: x == selected ? Colors.red : Colors.grey,
                    shape: BoxShape.circle),
                child: Text('$x'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
