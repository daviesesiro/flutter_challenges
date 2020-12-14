import 'dart:math';

import 'package:flutter/material.dart';

Color generateRandomColor() {
  return Color.fromRGBO(Random().nextInt(255) + 50, Random().nextInt(255) + 50,
      Random().nextInt(255) + 50, 1);
}
