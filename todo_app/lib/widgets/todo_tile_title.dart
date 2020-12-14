import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';

class TodoTileTitle extends StatefulWidget {
  final String title;
  final bool value;
  TodoTileTitle(this.title, this.value);

  @override
  _TodoTileTitleState createState() => _TodoTileTitleState();
}

class _TodoTileTitleState extends State<TodoTileTitle>
    with AfterLayoutMixin<TodoTileTitle> {
  final GlobalKey _keyTitle = GlobalKey();
  double strokeLength = 0;

  _getProgressIndcatorSize() {
    setState(() {
      strokeLength =
          (_keyTitle.currentContext.findRenderObject() as RenderBox).size.width;
    });

    print(strokeLength);
  }

  @override
  void afterFirstLayout(BuildContext context) {
    _getProgressIndcatorSize();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Theme.of(context).primaryColor,
          ),
          key: _keyTitle,
        ),
        AnimatedContainer(
          transform: Matrix4.identity()..translate(-5.0),
          duration: Duration(milliseconds: 200),
          height: 2,
          width: widget.value ? strokeLength + 10 : 0,
          color: Colors.black,
        )
      ],
    );
  }
}
