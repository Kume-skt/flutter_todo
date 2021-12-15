import 'package:flutter/material.dart';
import 'package:flutter_todo/provider/todo/todo.dart';
import 'package:provider/provider.dart';

class MakeTodoView extends StatefulWidget {
  final String title = "todo 作成";

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MakeTodoView> {
  late String _title = "";
  void _onChaengeTitle(String val) {
    setState(() {
      _title = val;
    });
  }

  void _makeTodo(BuildContext context) {
    context.read<TodoList>().makeTodo(_title);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
                padding: EdgeInsets.all(30),
                child: TextField(
                  // controller: _textEditingController,
                  style: TextStyle(fontSize: 20),
                  onChanged: _onChaengeTitle,
                  decoration: InputDecoration(
                    hintText: "タイトル",
                  ),
                )),
            Padding(
              padding: EdgeInsets.all(30),
              child: ElevatedButton(
                child: const Text('追加'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  onPrimary: Colors.white,
                ),
                onPressed: () => _makeTodo(context),
              ),
            ),
          ],
        ));
  }
}
