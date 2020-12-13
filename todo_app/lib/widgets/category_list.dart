import 'package:flutter/material.dart';
import 'package:todo_app/dummydata/category_dummy_data.dart';

import 'category_card.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      child: Row(
        children: [
          ...DUMMY_CATEGORIES.map((category) => CategoryCard(category)).toList()
        ],
      ),
    );
  }
}
