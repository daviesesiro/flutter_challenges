import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final String title;
  final Widget icon;
  final bool selected;
  final Widget secondaryIcon;
  CategoryTile(
      {this.title, this.icon, this.selected = false, this.secondaryIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
      width: 190,
      height: 240,
      child: Card(
        shadowColor: selected ? Theme.of(context).primaryColor : Colors.black38,
        elevation: 5,
        color: selected ? Theme.of(context).primaryColor : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: InkWell(
          onTap: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: selected ? Colors.white : Colors.black),
              ),
              SizedBox(height: 20),
              selected ? icon : secondaryIcon
            ],
          ),
        ),
      ),
    );
  }
}
