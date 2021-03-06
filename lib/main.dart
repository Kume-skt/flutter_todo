import 'package:flutter/material.dart';
import 'package:flutter_todo/makeTodo.dart';
import 'package:flutter_todo/provider/counter/index.dart';
import 'package:flutter_todo/provider/todo/todo.dart';
import 'package:flutter_todo/provider/todo/todoListView.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<Counter>(create: (_) => Counter()),
        ChangeNotifierProvider<TodoList>(create: (_) => TodoList()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Todo リスト'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _makeTodoPage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return MakeTodoView();
    }));
  }

  @override
  Widget build(BuildContext context) {
    TodoList _todoList = context.watch<TodoList>();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: TodoViews(_todoList),

      floatingActionButton: FloatingActionButton(
        onPressed: () => _makeTodoPage(context),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
