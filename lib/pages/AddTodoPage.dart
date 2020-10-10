import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/Todos.dart';

class AddTodoPage extends StatefulWidget {
  static const routeName = '/add-todo';

  @override
  _AddTodoPageState createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  void _saveTodo() {
    if (_titleController.text.isEmpty) return;
    Provider.of<Todos>(context, listen: false).addTodo(
      title: _titleController.text,
      description: _descriptionController.text,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add a todo'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(labelText: 'Title'),
                        controller: _titleController,
                      ),
                      SizedBox(height: 10),
                      TextField(
                        decoration: InputDecoration(labelText: 'Description'),
                        controller: _descriptionController,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            RaisedButton.icon(
              onPressed: _saveTodo,
              icon: Icon(Icons.add),
              label: Text('Add todo'),
              elevation: 0,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              color: Theme.of(context).accentColor,
            ),
          ],
        ));
  }
}
