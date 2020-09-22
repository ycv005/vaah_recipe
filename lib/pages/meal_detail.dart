import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealDetail extends StatelessWidget {
  static const routeName = '/meal-detail';
  final Function togglefavourite, isFavouriteMeal;
  const MealDetail(this.togglefavourite, this.isFavouriteMeal);

  Widget buildContainer(BuildContext context, Widget child) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width * 0.85,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as Map;
    final Meal meal = args['obj'];
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image(
                image: CachedNetworkImageProvider(meal.imgUrl),
                fit: BoxFit.cover,
              ),
            ),
            Container(
              child: const Text(
                "Ingredients",
                style: TextStyle(
                  fontSize: 26,
                ),
              ),
            ),
            buildContainer(
              context,
              ListView.builder(
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Card(
                    color: Theme.of(context).primaryColorLight,
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(meal.ingredients[index]),
                    ),
                  ),
                ),
                itemCount: meal.ingredients.length,
              ),
            ),
            Container(
              child: const Text(
                "Steps",
                style: TextStyle(
                  fontSize: 26,
                ),
              ),
            ),
            buildContainer(
              context,
              ListView.builder(
                itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text("# " + (index + 1).toString()),
                      ),
                      title: Text(meal.steps[index]),
                    ),
                    Divider()
                  ],
                ),
                itemCount: meal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => togglefavourite(meal.id),
        child: Icon(
            isFavouriteMeal(meal.id) ? Icons.favorite : Icons.favorite_border),
      ),
    );
  }
}
