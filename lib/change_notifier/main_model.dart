import 'package:flutter/material.dart';

class MainModel extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  set counter(int value) {
    if (value != _counter) {
      _counter = value;
      notifyListeners();
    }
  }
}