import 'package:flutter/material.dart';
import 'package:todo_app/model/Category.dart';
import 'package:todo_app/widgets/custom_linear_indicator.dart';

class CategoryCard extends StatelessWidget {
  final Category category;

  CategoryCard(this.category);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20, top: 20, bottom: 20),
      height: 180,
      width: 260,
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('40 Task', style: Theme.of(context).textTheme.subtitle1),
              SizedBox(height: 5),
              Text(
                category.name,
                style: Theme.of(context).textTheme.headline5.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(height: 30),
              CustomProgressIndicator(
                value: category.value,
                color: category.color,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
