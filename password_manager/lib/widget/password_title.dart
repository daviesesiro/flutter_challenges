import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class PasswordTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String img;

  PasswordTile({this.title, this.subtitle, this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.25,
        secondaryActions: <Widget>[
          IconSlideAction(
            color: Colors.transparent,
            foregroundColor: Colors.grey,
            icon: Icons.edit,
            onTap: () => {},
          ),
          IconSlideAction(
            color: Colors.transparent,
            icon: Icons.delete,
            foregroundColor: Colors.red,
            onTap: () => {},
          ),
        ],
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            leading: Image.asset(
              'assets/images/$img.png',
              height: 45,
            ),
            title: Text(title),
            subtitle: Text(subtitle),
          ),
        ),
      ),
    );
  }
}
