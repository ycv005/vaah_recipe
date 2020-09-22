import 'package:flutter/material.dart';
import 'package:vaah_recipe/widgets/meal_item.dart';
import '../models/meal.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> favouriteMeal;
  const FavouriteScreen(this.favouriteMeal);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: favouriteMeal.isEmpty
          ? Text("No Favourite Meals you have! Add Now")
          : ListView.builder(
              itemBuilder: (context, index) {
                final meal = favouriteMeal[index];
                return MealItem(meal);
              },
              itemCount: favouriteMeal.length,
            ),
    );
  }
}
