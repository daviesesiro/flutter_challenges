import 'dart:math';

import 'package:todo_app/helpers/generate_random_color.dart';
import 'package:todo_app/model/Category.dart';
import 'package:uuid/uuid.dart';

var uuid = Uuid();

// ignore: non_constant_identifier_names
final List<Category> DUMMY_CATEGORIES = [
  Category(
      id: uuid.v4(),
      name: 'Business',
      color: generateRandomColor(),
      value: Random().nextDouble()),
  Category(
      id: uuid.v4(),
      name: 'Personal',
      color: generateRandomColor(),
      value: Random().nextDouble()),
  Category(
      id: uuid.v4(),
      name: 'School',
      color: generateRandomColor(),
      value: Random().nextDouble())
];


