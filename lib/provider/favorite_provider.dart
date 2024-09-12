import 'package:flutter/cupertino.dart';

class FavoriteProvider with ChangeNotifier{
  final List<int> _selectedItem = [];
  List <int> get selectedItem => _selectedItem;

  void addIndex(index){
    selectedItem.add(index);
    notifyListeners();
  }
  void removeIndex(index){
    selectedItem.remove(index);
    notifyListeners();
  }
}