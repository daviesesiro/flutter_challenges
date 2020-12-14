import 'dart:math';

import 'package:todo_app/helpers/generate_random_color.dart';
import 'package:todo_app/model/Category.dart';
import 'package:todo_app/model/Todo.dart';
import 'package:uuid/uuid.dart';

var uuid = Uuid();

// ignore: non_constant_identifier_names
final List<Category> DUMMY_CATEGORIES = [
  Category(
      id: 'cat-1',
      name: 'Business',
      color: generateRandomColor(),
      value: Random().nextDouble()),
  Category(
      id: 'cat-2',
      name: 'Personal',
      color: generateRandomColor(),
      value: Random().nextDouble()),
  Category(
      id: 'cat-3',
      name: 'School',
      color: generateRandomColor(),
      value: Random().nextDouble()),
];

// ignore: non_constant_identifier_names
final List<Todo> DUMMY_TODOS = List.generate(
  10,
  (index) => Todo(
    id: "todo-$index",
    categoryId: "cat-${Random().nextInt(3) + 1}",
    title: "A random todo i guess",
    status: Random().nextBool() ? TodoStatus.DONE : TodoStatus.ONGOING,
  ),
);
