import 'package:flutter/material.dart';

import 'password_title.dart';

class PasswordList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        PasswordTile(
          title: "Gmail",
          subtitle: 'john.doe@gmail.com',
          img: 'google',
        ),
        PasswordTile(
          title: "Facebook",
          subtitle: 'john.doe@yahoo.com',
          img: 'facebook',
        ),
        PasswordTile(
          title: "Instagram",
          subtitle: '+234 817 4343',
          img: 'instagram',
        ),
        PasswordTile(
          title: "Snapchat",
          subtitle: '+234 817 4343',
          img: 'snapchat',
        ),
      ],
    );
  }
}
