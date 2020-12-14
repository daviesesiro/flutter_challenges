import 'package:flutter/material.dart';
import 'package:todo_app/helpers/palette.dart';
import 'package:todo_app/screens/home.screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo app',
      theme: ThemeData(
        primarySwatch: myPallete,
        accentColor: myAccentPallete.shade200,
        scaffoldBackgroundColor: myPallete.shade50,
        textTheme: TextTheme().copyWith(
            subtitle1: TextStyle(
                color: myPallete.shade200, fontWeight: FontWeight.bold),
            headline4: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: myPallete.shade500),
            headline5: TextStyle(color: myPallete.shade500)),
        appBarTheme: AppBarTheme().copyWith(
          iconTheme: IconThemeData().copyWith(color: myPallete.shade300),
          color: myPallete.shade50,
          elevation: 0.0,
        ),
        cardTheme: CardTheme()
            .copyWith(shadowColor: myPallete.shade100.withOpacity(.3)),
      ),
      home: HomePage(),
    );
  }
}
