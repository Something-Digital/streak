import 'package:flutter/foundation.dart';

class Todo {
  final String id;
  final String title;
  final String description;
  final int streak;
  DateTime lastTime;

  Todo({
    @required this.id,
    @required this.title,
    this.description = '',
    this.streak = 0,
    this.lastTime,
  });
}
