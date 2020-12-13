import 'package:flutter/material.dart';

const int _myPalettePrimaryValue = 0xFF0E1F55;
const MaterialColor myPallete = MaterialColor(
  _myPalettePrimaryValue,
  <int, Color>{
    50: Color(0xFFF5F7FC),
    100: Color(0xFFB7BCCC),
    200: Color(0xFF878FAA),
    300: Color(0xFF566288),
    400: Color(0xFF32416F),
    500: Color(_myPalettePrimaryValue),
    600: Color(0xFF0C1B4E),
    700: Color(0xFF0A1744),
    800: Color(0xFF08123B),
    900: Color(0xFF040A2A),
  },
);

const MaterialColor myAccentPallete =
    MaterialColor(_myAccentPalleteValue, <int, Color>{
  100: Color(0xFF6475FF),
  200: Color(_myAccentPalleteValue),
  400: Color(0xFF001BFD),
  700: Color(0xFF0018E4),
});
const int _myAccentPalleteValue = 0xFF076aff;
