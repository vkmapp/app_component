import 'package:app_component/pages/card/bubble_row.dart';
import 'package:app_component/pages/card/bubble_service.dart';
import 'package:app_component/pages/color.dart';
import 'package:flutter/material.dart';

class CardService extends StatefulWidget {
  const CardService({Key? key}) : super(key: key);

  @override
  _CardServiceState createState() => _CardServiceState();
}

class _CardServiceState extends State<CardService> {
  /// Expand
  bool isExpanded = true;
  double sizeHeight = 110;

  List<String> serviceNames = [
    'Menu Name',
    'Name One',
    'Name Two',
    'Name Three',
  ];

  void expandWidget() {
    setState(() {
      sizeHeight = 140;
    });
  }

  void shrinkWidget() {
    setState(() {
      sizeHeight = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text('Service'),
          actions: [
            IconButton(
                onPressed: () {
                  print(isExpanded);
                  setState(() {
                    isExpanded = !isExpanded;
                    isExpanded ? expandWidget() : shrinkWidget();
                  });
                },
                icon: const Icon(Icons.expand)),
          ],
          backgroundColor: kPrimary,
          elevation: isExpanded ? 2 : 0 ,
        ),
        body: Container(
          color: kPrimary,
          child: AnimatedContainer(
            height: sizeHeight,
            curve: Curves.easeInCubic,
            duration: const Duration(milliseconds: 600),
            child: Center(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return BubbleRow(
                    name: serviceNames[index],
                    icon: Icons.image,
                  );
                },
                itemCount: serviceNames.length,
                itemExtent: MediaQuery.of(context).size.width / 4,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
