import 'package:flutter/material.dart';

import 'category_tile.dart';

class CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            CategoryTile(
              title: "Socials",
              icon: Image.asset('assets/images/people-white.png', height: 40),
              secondaryIcon:
                  Image.asset('assets/images/people-black.png', width: 40),
              selected: true,
            ),
            CategoryTile(
              title: "Payments",
              icon: Icon(Icons.credit_card, color: Colors.white, size: 40),
              secondaryIcon: Icon(Icons.credit_card, size: 40),
            ),
            CategoryTile(
              title: "Notes",
              icon: Icon(Icons.note_outlined, color: Colors.white, size: 40),
              secondaryIcon: Icon(Icons.note_outlined, size: 40),
            )
          ],
        ),
      ),
    );
  }
}
