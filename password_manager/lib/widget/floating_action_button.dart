import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
        bottom: 30,
        right: 20,
        height: 65,
        child: FittedBox(
          child: FloatingActionButton(
            elevation: 0,
            child: Icon(
              Icons.add,
              size: 40,
            ),
            onPressed: () {},
          ),
        ),
      ),
    ]);
  }
}
