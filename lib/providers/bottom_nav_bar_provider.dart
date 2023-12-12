import 'package:flutter/material.dart';



class BottomNavBarProvider extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  updateCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
  int _currentCartCount = 0;

  int get currentCount => _currentCartCount;

  clearCartCount()async{
    _currentCartCount = 0;
    notifyListeners();
  }
}