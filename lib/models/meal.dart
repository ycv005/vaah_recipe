import 'package:flutter/material.dart';

enum Complexity { Simple, Mediunm, Hard }

enum Affordability { Affordable, Pricey, Luxurious }

class Meal {
  final String id, title, imgUrl;
  final List<String> categories, ingredients, steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree, isVeg, isLactoseFree;

  const Meal({
    @required this.id,
    @required this.title,
    @required this.imgUrl,
    @required this.complexity,
    @required this.affordability,
    @required this.ingredients,
    @required this.isGlutenFree,
    @required this.isLactoseFree,
    @required this.isVeg,
    @required this.duration,
    @required this.steps,
    @required this.categories,
  });
}
