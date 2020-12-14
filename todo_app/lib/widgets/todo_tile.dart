import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo_app/dummydata/category_dummy_data.dart';
import 'package:todo_app/helpers/palette.dart';
import 'package:todo_app/model/Category.dart';
import 'package:todo_app/model/Todo.dart';
import 'package:todo_app/widgets/todo_tile_title.dart';

class TodoTile extends StatefulWidget {
  final Todo todo;
  TodoTile({this.todo});

  @override
  _TodoTileState createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  Category getTodoCategory() {
    return DUMMY_CATEGORIES
        .firstWhere((cat) => cat.id == widget.todo.categoryId);
  }

  bool value;
  Color color;
  @override
  void initState() {
    super.initState();
    value = Random().nextBool();
    color = value ? myPallete.shade200 : Colors.white;
  }

  void onPress() {
    setState(() {
      value = !value;
      color = value ? myPallete.shade200 : Colors.white;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 2, vertical: 8),
      child: InkWell(
        onTap: onPress,
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 18),
          title: TodoTileTitle(widget.todo.title, value),
          leading: _buildCheckBox(size: 3),
        ),
      ),
    );
  }

  Widget _buildCheckBox({double size}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      curve: Curves.fastLinearToSlowEaseIn,
      height: size * 10,
      width: size * 10,
      transformAlignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(size * 10 * .5),
        border:
            Border.all(color: getTodoCategory().color, width: value ? 0 : 3),
      ),
      child: AnimatedOpacity(
          duration: Duration(milliseconds: 200),
          opacity: value ? 1.0 : 0.0,
          child: Icon(
            Icons.check,
            color: Colors.white,
          )),
    );
  }
}
