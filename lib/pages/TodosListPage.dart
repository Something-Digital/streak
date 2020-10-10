import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/AddTodoPage.dart';

import '../providers/Todos.dart';

class TodosListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your todos'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddTodoPage.routeName);
            },
          )
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<Todos>(context, listen: false).fetchAndSetTodos(),
        builder: (ctx, snap) => snap.connectionState == ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<Todos>(
                child: Center(
                  child: const Text('Got no todos yet, start adding some!'),
                ),
                builder: (ctx, todos, ch) => todos.items.length <= 0
                    ? ch
                    : ListView.builder(
                        itemCount: todos.items.length,
                        itemBuilder: (ctx, i) => ListTile(
                          leading: CircleAvatar(
                            child: Text(todos.items[i].title),
                            // backgroundImage: FileImage(todos.items[i].image),
                          ),
                          title: Text(todos.items[i].title),
                          subtitle: todos.items[i].description == ''
                              ? null
                              : Text(todos.items[i].description),
                          onTap: () {},
                        ),
                      ),
              ),
      ),
    );
  }
}
