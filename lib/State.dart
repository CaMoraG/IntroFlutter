import 'package:flutter/cupertino.dart';

class GameState extends ChangeNotifier{
  int _counter = 0;
  int get counter => _counter;

  void increment(){
    _counter++;
    notifyListeners();
  }
}