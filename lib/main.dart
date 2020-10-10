import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/Todos.dart';

import './pages/TodosListPage.dart';
import './pages/AddTodoPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: Todos(),
      child: MaterialApp(
        title: 'STREAK',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.amber,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: TodosListPage(),
        routes: {
          AddTodoPage.routeName: (_) => AddTodoPage(),
        },
      ),
    );
  }
}
