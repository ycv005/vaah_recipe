import 'package:flutter/material.dart';
import 'package:vaah_recipe/pages/category_meals.dart';
import '../models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  CategoryItem(this.category);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context)
          .pushNamed(CategoryMealPage.routeName, arguments: {"obj": category}),
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Text(category.title),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  category.color.withOpacity(0.7),
                  category.color,
                ])),
      ),
    );
  }
}
