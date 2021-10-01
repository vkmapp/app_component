import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({Key? key}) : super(key: key);

  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  /// Data
  List<int> data = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1];

  /// Build Item List
  Widget _buildItemList(BuildContext context, int index) {
    if (index == data.length) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Container(
      width: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.yellow,
            width: 150,
            height: 200,
            child: Center(
              child: Text(
                '${data[index]}',
                style: TextStyle(fontSize: 50.0, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: ScrollSnapList(
              itemBuilder: _buildItemList,
              itemSize: 150,
              dynamicItemSize: true,
              onReachEnd: () {
                print('Done!');
              },
              itemCount: data.length, onItemFocus: (int ) {  },
            ),
          ),
        ],
      ),
    );
  }
}
