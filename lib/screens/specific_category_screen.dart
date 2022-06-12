// ignore_for_file: must_call_super, use_key_in_widget_constructors

import 'package:flutter/material.dart';

import '../models/meal.dart';
import '/widgets/meal_item.dart';
import '../dummy_data.dart';

class SpecificCategoryScreen extends StatefulWidget {
  static const routeName = '/specificCategory';
  final List<Meal> availableMeals;

  SpecificCategoryScreen(this.availableMeals);

  @override
  State<SpecificCategoryScreen> createState() => _SpecificCategoryScreenState();
}

class _SpecificCategoryScreenState extends State<SpecificCategoryScreen> {
  // final String id;
  late var catTitle;
  late List<Meal> displayMeals;
  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  // }

  void didChangeDependencies() {
    // ignore: todo
    // TODO: implement didChangeDependencies
    final routeArg =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    catTitle = routeArg['title'];
    final catId = routeArg['id'];
    displayMeals = widget.availableMeals
        .where((meal) => meal.categories.contains(catId))
        .toList();
  }

  void _removeItem(String mealId) {
    setState(() {
      displayMeals.removeWhere((meal) => meal.id == mealId);
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
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
            id: displayMeals[index].id,
            title: displayMeals[index].title,
            affordability: displayMeals[index].affordability,
            complexity: displayMeals[index].complexity,
            duration: displayMeals[index].duration,
            imageUrl: displayMeals[index].imageUrl,
            removeItem: _removeItem,
          );
        },
        itemCount: displayMeals.length,
      ),
    );
  }
}
