import 'package:flutter/material.dart';
import 'package:todo_app/widgets/category_list.dart';
import 'package:todo_app/widgets/cutom_drawer.dart';
import 'package:todo_app/widgets/page_with_custom_drawer.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomePage extends HookWidget {
  HomePage();

  @override
  Widget build(BuildContext context) {
    var showDrawer = useState(false);
    toggleDrawer() {
      showDrawer.value = !showDrawer.value;
    }

    return PageWithCustomDrawer(
      duration: Duration(milliseconds: 500),
      showDrawer: showDrawer.value,
      customDrawer: CustomDrawer(
        toggle: toggleDrawer,
      ),
      page: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: toggleDrawer,
          ),
          actions: [
            IconButton(icon: Icon(Icons.search), onPressed: () {}),
            IconButton(
              icon: Icon(Icons.alarm),
              onPressed: () {},
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.plus_one),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text("What's up, User!",
                  style: Theme.of(context).textTheme.headline4),
              SizedBox(height: 40),
              buildSection(context, 'categories'),
              SizedBox(height: 10),
              CategoryList(),
              SizedBox(height: 30),
              buildSection(context, 'Today\'s todo'),
              ListView.builder(
                itemCount: 3,
                itemBuilder: (_, __) => Container(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Text buildSection(BuildContext context, String text) =>
      Text(text.toUpperCase(), style: Theme.of(context).textTheme.subtitle1);
}
