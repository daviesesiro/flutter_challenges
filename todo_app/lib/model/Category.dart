import 'dart:ui';

import 'package:flutter/foundation.dart';

class Category {
  final String id;
  final String name;
  final Color color;
  final double value;

  Category(
      {@required this.id,
      @required this.name,
      @required this.color,
      @required this.value}) {
    print(value);
  }
}
