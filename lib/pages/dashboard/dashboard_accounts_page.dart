import 'package:app_component/pages/color.dart';
import 'package:flutter/material.dart';

class DashboardAccountsWidget extends StatefulWidget {
  const DashboardAccountsWidget({Key? key}) : super(key: key);

  @override
  _DashboardAccountsWidgetState createState() => _DashboardAccountsWidgetState();
}

class _DashboardAccountsWidgetState extends State<DashboardAccountsWidget> with SingleTickerProviderStateMixin {

  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Tabname 1',),
    Tab(text: 'Tabname 2'),
    Tab(text: 'Tabname 3'),
  ];

   late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8),
      child: Column(children: [
        TabBar(
          unselectedLabelColor: Colors.black,
          labelColor: kPrimary,
          //indicatorColor: kPrimary,
          controller: _tabController,
          indicatorWeight: 2,
          indicatorColor:Colors.black,
          tabs: myTabs,

        ),
        Expanded(
          child: TabBarView(
              controller: _tabController,
              children: myTabs.map((Tab tab) {
                final String label = tab.text!.toLowerCase();
                return Center(
                  child: Text(
                    'This is the $label tab',
                    style: const TextStyle(fontSize: 10),
                  ),
                );
              }).toList(),
          ),
        ),
      ],),
    );
  }
}

/*
Center(child: Text('ghgh'),)

Scaffold(
      appBar: AppBar(
        toolbarHeight: 10,
        backgroundColor: Colors.transparent,
        bottom: TabBar(
          controller: _tabController,
          tabs: myTabs,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: myTabs.map((Tab tab) {
          final String label = tab.text!.toLowerCase();
          return Center(
            child: Text(
              'This is the $label tab',
              style: const TextStyle(fontSize: 36),
            ),
          );
        }).toList(),
      ),
    );
 */