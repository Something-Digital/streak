import 'package:flutter/foundation.dart';

class Todo {
  final String id;
  final String title;
  final String description;
  int streak;
  DateTime lastActionTime;

  Todo({
    @required this.id,
    @required this.title,
    this.description = '',
    this.streak,
    this.lastActionTime,
  });
}
