import 'package:flutter/foundation.dart';

import '../models/Todo.dart';

import '../helpers/DBHelper.dart';

class Todos with ChangeNotifier {
  static const _DB_TABLE = 'todos';

  List<Todo> _items = [];

  List<Todo> get items {
    return [..._items];
  }

  void addTodo({
    String title,
    String description,
    int streak,
  }) {
    final newTodo = Todo(
      id: DateTime.now().toString(),
      title: title,
      description: description,
    );
    _items.add(newTodo);
    notifyListeners();
    DBHelper.insert(
      _DB_TABLE,
      {
        'id': newTodo.id,
        'title': newTodo.title,
        'description': newTodo.description,
        'streak': newTodo.streak,
        'lastActionTime': newTodo.lastActionTime,
      },
    );
  }

  Future<void> fetchAndSetTodos() async {
    final todos = await DBHelper.getData(_DB_TABLE);
    _items = todos
        .map(
          (todo) => Todo(
            id: todo['id'],
            title: todo['title'],
            description: todo['description'],
            streak: todo['streak'],
          ),
        )
        .toList();
    notifyListeners();
  }
}
