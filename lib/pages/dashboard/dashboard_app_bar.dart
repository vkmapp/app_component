import 'package:app_component/pages/color.dart';
import 'package:backdrop/backdrop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_profile_avatar/user_profile_avatar.dart';

class DashboardAppBar {
  static getDashboardAppBar() {
    return BackdropAppBar(
      backgroundColor: kPrimary,
      leading: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    child:
                        Image.network('https://picsum.photos/500/500?grayscale',),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  Positioned(top: 0,right:0,child: Icon(Icons.circle, size: 15,color: Colors.green,))
                ],
              ),
            ],
          ),
        ),
      ),
      centerTitle: false,
      actions: const [
        BackdropToggleButton(
          icon: AnimatedIcons.home_menu,
        )
      ],
    );
  }
}


/*
import 'package:app_component/pages/dashboard/dashboard_app_bar.dart';
import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';

import '../color.dart';

class DashboardMobile extends StatefulWidget {
  const DashboardMobile({Key? key}) : super(key: key);

  @override
  _DashboardMobileState createState() => _DashboardMobileState();
}

class _DashboardMobileState extends State<DashboardMobile> {
  late double width, height;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return NotificationListener(
        onNotification: (notifyInfo) {
          return true;
        },
        child: Container(
          padding: EdgeInsets.only(top: 20),
          color: kPrimary,
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: 55,
                    /*decoration: const BoxDecoration(
                        color: Colors.red,),*/

                    child: Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                        Spacer(),
                        Icon(Icons.add),
                        SizedBox(width: 10,),
                        Icon(Icons.add),
                        SizedBox(width: 10,),
                        Icon(Icons.add),
                        SizedBox(width: 10,),
                        Icon(Icons.add),
                        SizedBox(width: 10,),

                      ],),
                    ),
                  ),
                  Container(
                    height: height * .9,
                    //width: width,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(50))),
                    child:  SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Center(
                        child: Text('Body'),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 10,
                left: width * .1,
                child: Container(
                  width: 55,
                  height: 55,
                  child: ClipRRect(
                    child: Image.network(
                        'https://picsum.photos/500/500?grayscale'),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

/*
BackdropScaffold(
          backLayerBackgroundColor: kPrimary,
          appBar: DashboardAppBar.getDashboardAppBar(),
          backgroundColor: Colors.blueGrey,
          backLayer: Container(),
          frontLayer: Container(),
        ),
 */

 */