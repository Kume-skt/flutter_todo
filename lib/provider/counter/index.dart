import 'package:flutter/material.dart';

class Counter extends ChangeNotifier {
  late int _count;

  Counter() {
    _count = 10;
  }
  int get count => this._count;

  set setCount(int count) {
    _count = count;
  }
}
