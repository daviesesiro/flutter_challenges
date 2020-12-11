import 'package:flutter/material.dart';

import 'screens/messages.dart';
import 'widgets/custom_bottom_appbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Color(0xFF50BBFF),
        textTheme: TextTheme().copyWith(
          headline6: TextStyle(
            fontSize: 25,
          ),
        ),
        iconTheme: IconThemeData().copyWith(
          color: Theme.of(context).accentColor,
        ),
        appBarTheme: AppBarTheme().copyWith(
          elevation: 0.0,
          centerTitle: true,
          color: Colors.transparent,
        ),
      ),
      home: Center(child: Root()),
    );
  }
}

class Root extends StatefulWidget {
  const Root({Key key}) : super(key: key);

  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  int selectedScreenIdx = 1;

  final PageStorageBucket bucket = PageStorageBucket();

  List<Map<String, Widget>> screens = [
    {'Home': ChatList()},
    {'Messages': Messages()},
    {'Favorites': Favourite()},
    {'Profile': Profile()},
  ];

  void changeScreen(int idx) {
    setState(() {
      selectedScreenIdx = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.edit_outlined), onPressed: () {}),
        title: Text(screens[selectedScreenIdx].keys.first,
            style: Theme.of(context).textTheme.headline6),
        actions: [
          IconButton(
            icon: Image.asset('images/search.png', height: 24),
            onPressed: () {},
          ),
        ],
      ),
      floatingActionButton: buildFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomAppBar(
          changeScreen: changeScreen, selectedIdx: selectedScreenIdx),
      body: PageStorage(
        bucket: bucket,
        child: screens[selectedScreenIdx].values.first,
      ),
    );
  }

  FloatingActionButton buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {},
      child: Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}

class ChatList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text('chatList'));
  }
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text('profile'));
  }
}

class Favourite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text('favoirite'));
  }
}
