import 'package:flutter/material.dart';

// todo オブジェクト
class Todo extends ChangeNotifier {
  late String _title;

  Todo(String title) {
    _title = title;

    notifyListeners();
  }
  String get title => _title;
  void setTitle(String newTitle) {
    _title = newTitle;
    notifyListeners();
  }
}

// todoのリスト管理
class TodoList extends ChangeNotifier {
  late List<Todo> _todoList = [];

  makeTodo(String title) {
    _todoList.add(new Todo(title));
    notifyListeners();
  }

  deleteTodo(int index) {
    _todoList.removeAt(index);
    notifyListeners();
  }

  List<Todo> get todoList => _todoList;
}
