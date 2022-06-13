// ignore_for_file: deprecated_member_use, non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal_detail';

  final Function toogleFavourite;
  final isFavourite;

  MealDetailScreen(this.toogleFavourite, this.isFavourite);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal =
        DUMMY_MEALS.firstWhere((element) => element.id == mealId);
    final appBar = AppBar(
      title: Text(selectedMeal.title),
    );

    Widget BuildSectionTitle(String title) {
      return Container(
        height: (MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top -
                appBar.preferredSize.height) *
            0.04,
        margin: const EdgeInsets.symmetric(vertical: 7),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
      );
    }

    Widget BuildContainer(String title, Widget child, double per) {
      return Container(
        height: (MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top -
                appBar.preferredSize.height) *
            per,
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(10),
          color: title == 'Steps'
              ? const Color.fromRGBO(243, 140, 16, 0.3)
              : const Color.fromRGBO(243, 140, 16, 0),
        ),
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(5),
        child: child,
      );
    }

    return Scaffold(
      appBar: appBar,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(204, 255, 255, 255),
        onPressed: //() {
            //   Navigator.of(context).pop(mealId);
            // },
            (() => toogleFavourite(mealId)),
        child: Icon(
          isFavourite(mealId)
              ? CupertinoIcons.heart_fill
              : CupertinoIcons.heart,
          color: Colors.red,
          size: 40,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            height: (MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top -
                    appBar.preferredSize.height) *
                0.45,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          BuildSectionTitle('Ingredients'),
          BuildContainer(
              'Ingredients',
              ListView.builder(
                itemBuilder: ((context, index) => Card(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      color: const Color.fromRGBO(243, 140, 16, 0.3),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(selectedMeal.ingredients[index],
                            style: const TextStyle(
                              fontFamily: 'Raleway',
                              color: Colors.black,
                              fontSize: 15,
                            )),
                      ),
                    )),
                itemCount: selectedMeal.ingredients.length,
              ),
              0.25),
          BuildSectionTitle('Steps'),
          BuildContainer(
              'Steps',
              ListView.builder(
                itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          '# ${index + 1}',
                          style: const TextStyle(
                            fontFamily: 'Raleway',
                            color: Colors.black,
                          ),
                        ),
                      ),
                      title: Text(
                        selectedMeal.steps[index],
                        style: const TextStyle(
                            fontFamily: 'Raleway', fontSize: 16),
                      ),
                    ),
                    const Divider(
                      color: Colors.black,
                    ),
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              ),
              0.5),
        ]),
      ),
    );
  }
}
