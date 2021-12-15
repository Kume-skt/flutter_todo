import 'package:flutter/material.dart';

class Counter extends ChangeNotifier {
  late int _count;

  Counter() {
    _count = 0;
  }
  int get count => this._count;

  void setCount(int count) {
    _count = count;
    notifyListeners();
  }
}
