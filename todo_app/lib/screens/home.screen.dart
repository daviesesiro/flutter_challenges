import 'package:flutter/material.dart';
import 'package:todo_app/dummydata/category_dummy_data.dart';
import 'package:todo_app/widgets/category_list.dart';
import 'package:todo_app/widgets/todo_tile.dart';
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
      duration: Duration(milliseconds: 800),
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
        floatingActionButton: Transform(
          transform: Matrix4.identity()..translate(-20.0, -40.0),
          child: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add, size: 30),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5),
              Text("What's up, Joy!",
                  style: Theme.of(context).textTheme.headline4),
              SizedBox(height: 20),
              buildSection(context, 'categories'),
              CategoryList(),
              SizedBox(height: 20),
              buildSection(context, 'Today\'s todo'),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: DUMMY_TODOS.length,
                  itemBuilder: (_, idx) => TodoTile(
                    todo: DUMMY_TODOS[idx],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Text buildSection(BuildContext context, String text) =>
      Text(text.toUpperCase(), style: Theme.of(context).textTheme.subtitle1);
}
