import 'package:flutter/material.dart';

import 'widget/category_list.dart';
import 'widget/floating_action_button.dart';
import 'widget/password_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Password manager',
      theme: ThemeData(
        primaryColor: Color(0xFF374BFB),
        accentColor: Color(0xFF5f6ef1),
        appBarTheme: AppBarTheme().copyWith(color: Color(0xFFF9F9F9)),
        fontFamily: 'Poppins',
        textTheme: TextTheme().copyWith(
          headline5: TextStyle(fontSize: 30, color: Colors.black),
          headline6: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Container(
          margin: EdgeInsets.only(left: 8),
          child: IconButton(
            icon: Image.asset(
              'assets/images/menu.png',
              width: 30,
            ),
            color: Colors.black,
            onPressed: () {},
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 8),
            child: IconButton(
              icon: Image.asset(
                'assets/images/search.png',
                width: 30,
              ),
              color: Colors.black,
              onPressed: () {},
            ),
          )
        ],
      ),
      floatingActionButton: CustomFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Container(
        color: Color(0xFFF9F9F9),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Categories', style: Theme.of(context).textTheme.headline5),
              CategoryList(),
              SizedBox(height: 30),
              Text('Passwords', style: Theme.of(context).textTheme.headline5),
              SizedBox(height: 20),
              Expanded(
                child: PasswordList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
