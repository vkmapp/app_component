import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class KeysWidget {
  late BuildContext buildBackdropContext;
}

class DashboardProvider with ChangeNotifier {

  BuildContext? _currentContextFront;
  BuildContext? get currentContextFront => _currentContextFront;
  set currentContextFront(BuildContext? context){
    _currentContextFront = context;
    // notifyListeners();
  }

  void toggleBackdropFront(){
    if(_currentContextFront != null){

      FocusScope.of(_currentContextFront!).unfocus();
      //if (isBackLayerConcealed) {
      Backdrop.of(_currentContextFront!).revealBackLayer();
      //} else {
        //concealBackLayer();
      //}
      //Backdrop.of(_currentContextFront!).fling();
    }
  }


  BuildContext? _currentContextBack;
  BuildContext? get currentContextBack => _currentContextBack;
  set currentContextBack(BuildContext? context){
    _currentContextBack = context;
    // notifyListeners();
  }
  void toggleBackdropBack(){
    if(_currentContextBack != null){

      FocusScope.of(_currentContextBack!).unfocus();
      //if (isBackLayerConcealed) {
      Backdrop.of(_currentContextBack!).concealBackLayer();
      //} else {
      //concealBackLayer();
      //}
      //Backdrop.of(_currentContextFront!).fling();
    }
  }



  void toggleBackdrop(){
    if(_currentContextFront != null){
      Backdrop.of(_currentContextFront!).fling();
    } else if(_currentContextBack != null){
      Backdrop.of(_currentContextBack!).fling();
    }
  }
}
