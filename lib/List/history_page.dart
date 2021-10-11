import 'package:flutter/material.dart';

import 'list_history.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: loadListHistory(),
            ),
            buildBottomButtonWidget(),
            SizedBox(height: 10)
          ],
        ),
      ),
    );
  }

  /// List History Widget
  /// Type [ListHistory]
  Widget loadListHistory() {
    return ListHistory(
      onTap: () {
        print('CALL BACK CLICK!');
      },
    );
  }

  /// Bottom Widget
  /// Type [Button]
  Widget buildBottomButtonWidget() {
    return Center(
      child: ElevatedButton(
        onPressed: () {},
        child: Text('Button'),
      ),
    );
  }
}
