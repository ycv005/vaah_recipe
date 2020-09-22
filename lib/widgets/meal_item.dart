import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:vaah_recipe/models/meal.dart';
import 'package:vaah_recipe/pages/meal_detail.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  const MealItem(this.meal);

  String get getMealComplexity {
    switch (meal.complexity) {
      case Complexity.Hard:
        return "Hard";
        break;
      case Complexity.Mediunm:
        return "Medium";
        break;
      case Complexity.Simple:
        return "Simple";
        break;
      default:
        return "None";
    }
  }

  String get getMealAfforadbility {
    switch (meal.affordability) {
      case Affordability.Affordable:
        return "Affordable";
        break;
      case Affordability.Pricey:
        return "Pricey";
        break;
      case Affordability.Luxurious:
        return "Luxurious";
        break;
      default:
        return "None";
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context)
          .pushNamed(MealDetail.routeName, arguments: {"obj": meal}),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(8),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(15),
                    topRight: const Radius.circular(15),
                  ),
                  child: Image(
                    image: CachedNetworkImageProvider(meal.imgUrl),
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    color: Colors.black54,
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: FittedBox(
                      child: Text(
                        meal.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Icon(Icons.schedule),
                    SizedBox(
                      width: 5,
                    ),
                    Text("${meal.duration}"),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.work),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      getMealComplexity,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.account_balance_wallet),
                    SizedBox(
                      width: 5,
                    ),
                    Text(getMealAfforadbility),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
