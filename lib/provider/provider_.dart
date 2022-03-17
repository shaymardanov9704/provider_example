import 'package:flutter/cupertino.dart';

class AppleProvider extends ChangeNotifier {
  int numberOfApple;

  AppleProvider({
    this.numberOfApple = 0
  });

  void addApple(int newValue){
    numberOfApple = newValue;
    notifyListeners();
  }
  void subtractionApple(int newValue){
    numberOfApple = newValue;
    notifyListeners();
  }
}