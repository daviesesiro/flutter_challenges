import 'package:flutter/foundation.dart';

class Todo {
  final String categoryId;
  final String id;
  final String title;
  final TodoStatus status;

  Todo({
    @required this.id,
    @required this.categoryId,
    @required this.title,
    @required this.status,
  });
}

enum TodoStatus {
  DONE,
  ONGOING,
}
