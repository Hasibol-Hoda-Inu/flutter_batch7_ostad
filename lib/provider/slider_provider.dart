import 'package:flutter/cupertino.dart';

class SliderProvider with ChangeNotifier{
  double _opacity= 1.0;
  double get opacity => _opacity;

  void changeOpacity(double changingOpacity){
    _opacity = changingOpacity;
    notifyListeners();
  }
}