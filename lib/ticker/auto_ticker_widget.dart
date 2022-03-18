import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AutoTickerWidget extends StatelessWidget {
  final ScrollController scrollController;
  final List images;

  const AutoTickerWidget(
      {Key? key, required this.scrollController, required this.images})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: SvgPicture.asset(
                  "assets/flags/sc.svg",
                  semanticsLabel: 'Acme Logo'
              ),
            ),
          );
        },
      ),
    );
  }
}
