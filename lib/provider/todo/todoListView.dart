import 'package:flutter/material.dart';
import 'package:flutter_todo/provider/todo/todo.dart';
import 'package:provider/provider.dart';

class TodoViews extends StatelessWidget {
  final TodoList _tList;
  TodoViews(this._tList);

  void onTapTitle(BuildContext context, Todo data) {
    // Navigator.push();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Dismissible(
            key: ObjectKey(_tList.todoList[index]),
            background: Container(
              padding: EdgeInsets.only(
                right: 10,
              ),
              alignment: AlignmentDirectional.centerEnd,
              color: Colors.red,
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              // スワイプ後に実行される（削除処理などを書く）
              print('onDismissed');
              context.read<TodoList>().deleteTodo(index);
            },
            child: Card(
              child: Padding(
                  child: ListTile(
                      onTap: () {},
                      title: Text(
                        _tList.todoList[index].title,
                        style: TextStyle(fontSize: 20),
                      )),
                  padding: EdgeInsets.all(10)),
              color: Colors.white,
            ));
      },
      shrinkWrap: true,
      itemCount: this._tList.todoList.length,
    );
  }
}
