import 'package:flutter/foundation.dart';

class FavouriteProvider with ChangeNotifier{
  List<int> _selectItem = [];
  List<int> get selectItem => _selectItem;

  void addItem(int value){
    selectItem.add(value);
    notifyListeners();
  }
  void removeItem(int value){
    selectItem.remove(value);
    notifyListeners();
  }
}