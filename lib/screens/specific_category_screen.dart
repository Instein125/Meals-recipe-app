import 'package:flutter/material.dart';

import '/widgets/meal_item.dart';
import '../dummy_data.dart';

class SpecificCategoryScreen extends StatelessWidget {
  static const routeName = '/specificCategory';
  // final String id;
  // final String title;
  // SpecificCategoryScreen(this.id, this.title);

  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final catTitle = routeArg['title'];
    final catId = routeArg['id'];
    final categoryMeals =
        DUMMY_MEALS.where((meal) => meal.categories.contains(catId)).toList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text(
          catTitle!,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            affordability: categoryMeals[index].affordability,
            complexity: categoryMeals[index].complexity,
            duration: categoryMeals[index].duration,
            imageUrl: categoryMeals[index].imageUrl,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
