import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';
import '../models/category.dart';

class CategoryMealPage extends StatelessWidget {
  static const routeName = '/category-meal';
  const CategoryMealPage(this.categoryMeals);
  final List<Meal> categoryMeals;
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as Map;
    final Category category = args['obj'];
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final meal = categoryMeals[index];
          return MealItem(meal);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
