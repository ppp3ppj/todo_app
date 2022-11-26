import 'package:crud_bloc/src/pages/add_todo.dart';
import 'package:flutter/cupertino.dart';
import 'package:crud_bloc/src/pages/homepage.dart';

class AppRoute {
  static const home = 'home';
  static const addTodo = 'addTodo';

  final _route = <String, WidgetBuilder>{
    home: (context) => MyHomePage(title: "HomePage"),
    addTodo: (context) => AddTodoPage(title: "add Todo"),
  };

  get getAll => _route;
}