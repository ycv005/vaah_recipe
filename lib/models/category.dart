import 'package:flutter/material.dart';

class Category {
  final String title, id;
  final Color color;
  const Category(
      {@required this.title, @required this.id, this.color = Colors.green});
}
