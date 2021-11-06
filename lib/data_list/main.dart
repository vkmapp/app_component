import 'package:app_component/data_list/page/foreach_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app_component/data_list/page/contains_page.dart';
import 'package:app_component/data_list/page/every_page.dart';
import 'package:app_component/data_list/page/expand_page.dart';
import 'package:app_component/data_list/page/fold_page.dart';
import 'package:app_component/data_list/page/foreach_page.dart';
import 'package:app_component/data_list/page/from_page.dart';
import 'package:app_component/data_list/page/map_page.dart';
import 'package:app_component/data_list/page/reduce_page.dart';
import 'package:app_component/data_list/page/sort_page.dart';
import 'package:app_component/data_list/page/take_skip_page.dart';
import 'package:app_component/data_list/page/where_page.dart';
import 'package:app_component/data_list/widget/tabbar_widget.dart';

import 'page/new_list.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => TabBarWidget(
        title: 'Utility Methods',
        tabs: [
          Tab(icon: Icon(Icons.color_lens), text: 'New List'),
          Tab(icon: Icon(Icons.color_lens), text: 'For Each'),
          Tab(icon: Icon(Icons.map), text: 'Map'),
          Tab(icon: Icon(Icons.space_bar), text: 'Contains'),
          Tab(icon: Icon(Icons.sort_by_alpha), text: 'Sort'),
          Tab(icon: Icon(Icons.reduce_capacity), text: 'Reduce'),
          Tab(icon: Icon(Icons.reduce_capacity), text: 'Fold'),
          Tab(icon: Icon(Icons.all_inclusive), text: 'Every'),
          Tab(icon: Icon(Icons.question_answer_outlined), text: 'Where'),
          Tab(icon: Icon(Icons.skip_next), text: 'Take & Skip'),
          Tab(icon: Icon(Icons.copy), text: 'From'),
          Tab(icon: Icon(Icons.expand), text: 'Expand'),
        ],
        children: [
          NewList(),
          ForEachPage(),
          MapPage(),
          ContainsPage(),
          SortPage(),
          ReducePage(),
          FoldPage(),
          EveryPage(),
          WherePage(),
          TakeSkipPage(),
          FromPage(),
          ExpandPage(),
        ],
      );
}
