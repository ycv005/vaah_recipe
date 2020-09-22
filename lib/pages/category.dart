import 'package:flutter/material.dart';
import '../models/dummy_data.dart';
import '../widgets/category_item.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      children: DUMMY_CATEGORIES.map((cat) => CategoryItem(cat)).toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
    );
  }
}
