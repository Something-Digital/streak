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
                        itemBuilder: (ctx, i) {
                          final item = todos.items[i];
                          return ListTile(
                            leading: CircleAvatar(
                              child: Text(item.streak == null
                                  ? '0'
                                  : item.streak.toString()),
                              // backgroundImage: FileImage(todos.items[i].image),
                            ),
                            title: Text(item.title),
                            subtitle: item.description == ''
                                ? null
                                : Text(
                                    'item.description ${item.lastActionTime}'),
                            trailing: IconButton(
                              icon: Icon(Icons.check_circle_outline),
                              tooltip: 'I did it today',
                              onPressed: () {
                                item.lastActionTime = DateTime.now(); // FIX IT!
                              },
                              color: item.lastActionTime != null &&
                                      item.lastActionTime
                                              .difference(DateTime.now())
                                              .inDays <
                                          1
                                  ? Colors.green
                                  : Colors.grey,
                              iconSize: 36,
                            ),
                            onTap: () {},
                          );
                        },
                      ),
              ),
      ),
    );
  }
}
