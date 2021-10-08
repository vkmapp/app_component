import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

import '../color.dart';
import 'backdrop_widget.dart';
import 'dashboard_accounts_page.dart';
import 'dashboard_backdrop_provider.dart';

class DashboardWithBackdrop extends StatefulWidget {
  const DashboardWithBackdrop({Key? key}) : super(key: key);

  @override
  _DashboardWithBackdropState createState() => _DashboardWithBackdropState();
}

class _DashboardWithBackdropState extends State<DashboardWithBackdrop> {
  late double width, height;
  int _selectedIndex = 0;

  /// Bottom Navigation Widget
  ///
  static const List<Widget> _widgetOptions = <Widget>[
    DashboardAccountsWidget(),
    Text(
      'Index 1: Business',
    ),
    Text(
      'Index 2: School',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;


    return NotificationListener(
      onNotification: (notifyInfo) {
        return true;
      },
      child: Scaffold(
        backgroundColor: kPrimary,
        body: Stack(
          children: [
            Positioned(
              top: 30.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                width: width,
                height: height,
                margin: EdgeInsets.only(top: 40),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    //topRight: Radius.circular(40.0),
                  ),
                ),
                child: ContextualControls(),
              ),
            ),
            dashboardAppbarWidget(context),
            profileWidget(context),
          ],
        ),
        bottomNavigationBar: bottomNavigationWidget(),
      ),
    );
  }




  /// Dashboard Appbar widget
  Widget dashboardAppbarWidget(BuildContext context) {
    return Positioned(
      top: 0.0,
      left: 0.0,
      right: 0.0,
      child: AppBar(
        elevation: 0.0,
        toolbarHeight: 46,
        title: profileTitleWidget(),
        backgroundColor: kPrimary,
        actions: [
          iconWidget(Icons.help_outline, context),
          iconWidget(Icons.search, context),
          iconWidget(Icons.notifications_active, context),
          iconWidget(Icons.logout, context),
        ],
      ),
    );
  }

  /// Dashboard profile widget
  Widget profileTitleWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 53.0, top: 7, ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Welcome!', style: TextStyle(fontSize: 10),),
          Text('Mr. Backdrop', style: TextStyle(fontSize: 12),),
        ],
      ),
    );
  }

  /// Dashboard Action bar widget
  Widget iconWidget(IconData icon, BuildContext context) {
    return InkWell(
      onTap: (){
        context.read<DashboardProvider>().toggleBackdrop();
      },
      child: SizedBox(
        width: 40,
        height: 40,
        child: Container(
          //color: Colors.blueGrey,
            child: Icon(
              icon,
              size: 20,
            )),
      ),
    );
  }

  /// Profile Image Widget
  Widget profileWidget(BuildContext context) {
    return Positioned(
      top: 30.0,
      left: 15.0,
      //right: 0.0,
      child: InkWell(
        onTap: (){
          Backdrop.of(context).revealBackLayer();
        },
        child: ClipRRect(
          child: Image.network(
            'https://picsum.photos/500/500?grayscale',
            width: 47,
            height: 47,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }

  /// Bottom Navigation Bar
  Widget bottomNavigationWidget() {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.white,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BottomNavigationBar(
          elevation: 0.0,
          backgroundColor: kPrimary,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Business',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'School',
            ),

          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(0.6),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
