import 'package:flutter/material.dart';

class CustomBottomAppBar extends StatelessWidget {
  final Function changeScreen;
  final selectedIdx;
  CustomBottomAppBar({this.changeScreen, this.selectedIdx});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 15,
      child: Container(
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  buildIconButton(context, Icons.home_outlined, 0),
                  buildIconButton(context, Icons.message_outlined, 1),
                ],
              ),
            ),

            SizedBox(width: 80),

            // Right Tab bar icons
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  buildIconButton(context, Icons.favorite_outline, 2),
                  buildIconButton(context, Icons.person_outline_outlined, 3),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  IconButton buildIconButton(BuildContext context, IconData icon, idx) {
    Color color = idx == selectedIdx
        ? Theme.of(context).accentColor
        : Theme.of(context).accentColor.withOpacity(.4);
    return IconButton(
      onPressed: () => changeScreen(idx),
      icon: Icon(icon),
      color: color,
    );
  }
}
