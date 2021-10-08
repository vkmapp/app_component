import 'package:flutter/material.dart';
import 'package:backdrop/backdrop.dart';
import 'package:provider/src/provider.dart';

import 'dashboard_backdrop_provider.dart';

/// Contextual controls preview app.
class ContextualControls extends StatefulWidget {
  @override
  _ContextualControlsState createState() => _ContextualControlsState();
}

class _ContextualControlsState extends State<ContextualControls> {
  static final _COLOR_MAP = {
    Colors.black: "Black",
    Colors.red: "Red",
    Colors.green: "Green",
    Colors.blue: "Blue"
  };
  static const _RAM_CHOICES = [4, 8, 16];

  Color _color = _COLOR_MAP.keys.first;
  double _resolution = 15.0;
  int _ram = _RAM_CHOICES.first;

  void openBackLayer(BuildContext context)
  {
    Backdrop.of(context).fling();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //context.read<DashboardProvider>().currentContext = context;
    return Theme(
      data: ThemeData.light(),
      child: MaterialApp(

        home: BackdropScaffold(
          /*appBar: BackdropAppBar(
            title: Text("Contextual Controls Example"),
            automaticallyImplyLeading: false,
          ),*/
          frontLayerBorderRadius: BorderRadius.only(topLeft: Radius.circular(20.0),),
          appBar: PreferredSize(child: SizedBox(), preferredSize: Size.zero),
          backLayer: _createBackLayer(context),
          frontLayer: _createFrontLayer(context),
          stickyFrontLayer: true,
        ),
      ),
    );
  }

  Widget _createBackLayer(BuildContext context) {
    context.read<DashboardProvider>().currentContextBack = context;
    return ListView(
      children: [
        ListTile(
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Color",
              ),
            ],
          ),
          title: DropdownButton<Color>(
            isExpanded: true,
            value: _color,
            items: _COLOR_MAP.keys.map<DropdownMenuItem<Color>>((Color c) {
              return DropdownMenuItem<Color>(
                value: c,
                child: Text(_COLOR_MAP[c]!),
              );
            }).toList(),
            onChanged: (Color? newValue) {
              setState(() {
                _color = newValue!;
              });
            },
          ),
        ),
        ListTile(
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Resolution"),
              ],
            ),
            title: Slider(
                activeColor: Colors.white,
                inactiveColor: Colors.lightBlue,
                value: _resolution,
                min: 14,
                max: 17,
                label: "$_resolution\"",
                divisions: 3,
                onChanged: (value) {
                  setState(() {
                    _resolution = value;
                  });
                })),
        ListTile(
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("RAM"),
            ],
          ),
          title: DropdownButton<int>(
            isExpanded: true,
            value: _ram,
            items: _RAM_CHOICES.map<DropdownMenuItem<int>>((int r) {
              return DropdownMenuItem<int>(
                value: r,
                child: Text("${r.toString()} GB"),
              );
            }).toList(),
            onChanged: (int? newValue) {
              setState(() {
                _ram = newValue!;
              });
            },
          ),
        ),
        Builder(
            builder: (context) => MaterialButton(
              child: Text("Return to product page"),
              onPressed: () => Backdrop.of(context).fling(),
            ))
      ],
      shrinkWrap: true,
    );
  }

  Widget _createFrontLayer(BuildContext context) {
    //context.read<DashboardProvider>().currentContextFront = context;
    //context.read<DashboardProvider>().toggleBackdropFront();
    return Container(
      margin: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.computer,
                size: 64.0,
                color: _color,
              ),
              Text(
                "Laptop",
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .apply(color: Colors.black),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.grey),
                    Icon(Icons.star, color: Colors.grey),
                    Icon(Icons.star, color: Colors.grey),
                    Icon(Icons.star, color: Colors.grey),
                    Icon(Icons.star_half, color: Colors.grey),
                  ],
                ),
                Text(
                  "73 Reviews",
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Price",
                style: TextStyle(color: Colors.grey),
              ),
              Container(
                margin: EdgeInsets.all(8.0),
                child: Text(
                  "\$999",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(
                top: 32.0, left: 8.0, right: 8.0, bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("Resolution")],
                ),
                Text(
                  "${_resolution.toString()}\"",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                top: 8.0, left: 8.0, right: 8.0, bottom: 32.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("RAM")],
                ),
                Text(
                  "${_ram.toString()} GB",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          ElevatedButton(
            child: Text("Configure 1"),
            onPressed: () {
              context.read<DashboardProvider>().currentContextFront = context;
              context.read<DashboardProvider>().toggleBackdropFront();
            },
          ),
          Container(
            margin: EdgeInsets.all(16.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Builder(
                  builder: (context) => ElevatedButton(
                    child: Text("Configure"),
                    onPressed: () {
                      context.read<DashboardProvider>().currentContextFront = context;
                      context.read<DashboardProvider>().toggleBackdropFront();
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
/*
BackdropScaffold(
                  //appBar: PreferredSize(child: SizedBox(), preferredSize: Size.zero),
                  headerHeight: 0.0,
                  revealBackLayerAtStart: false,
                  frontLayerBackgroundColor: Colors.black,
                  maintainBackLayerState: false,
                  subHeaderAlwaysActive: false,
                  subHeader: Container(color: Colors.red,),
                  backLayerScrim: Colors.red,
                  backLayerBackgroundColor: Colors.red,
                  //appBar: DashboardAppBar.getDashboardAppBar(),
                  backgroundColor: Colors.blueGrey,
                  backLayer: _backLayer(context),
                  frontLayer: _frontLayer(context),
                )
 */
