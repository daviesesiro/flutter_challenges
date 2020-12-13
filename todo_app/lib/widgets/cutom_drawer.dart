import 'package:flutter/material.dart';
import 'package:todo_app/helpers/custom_page_transition.dart';

class CustomDrawer extends StatelessWidget {
  final Function toggle;
  CustomDrawer({
    @required this.toggle,
  });

  @override
  Widget build(BuildContext context) {
    gotoPage(Widget page) {
      toggle();
      Navigator.push(context, CustomRoute(builder: (ctx) => page));
    }

    return GestureDetector(
      onTap: toggle,
      child: Container(
        width: double.infinity,
        color: Theme.of(context).primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FlatButton(
              child: Text('Another page'),
              onPressed: () => gotoPage(Container(
                color: Colors.pink,
              )),
            ),
          ],
        ),
      ),
    );
  }
}
