import 'package:flutter/foundation.dart';

class Todo {
  final String id;
  final String title;
  final String description;

  Todo({
    @required this.id,
    @required this.title,
    this.description = '',
  });
}
