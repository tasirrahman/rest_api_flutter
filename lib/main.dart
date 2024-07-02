import 'package:flutter/material.dart';
import 'package:rest_api_flutter/screens/add_todo.dart';
import 'package:rest_api_flutter/screens/todo_list.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(useMaterial3: false),
      theme: ThemeData.dark(useMaterial3: false),
      initialRoute: '/',
      routes: {
        '/add': (context) => const AddTodoInList(),
      },
      home: const TodoListPage(),
    );
  }
}
