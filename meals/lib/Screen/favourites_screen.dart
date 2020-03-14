import 'package:flutter/material.dart';
import 'package:meals/Models/meal.dart';
import 'package:meals/Widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {

  final List<Meal> favouriteMeals;
  FavouritesScreen(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      return Center(
        child: Text('You do not have any favourite meal yet'),
      );
    }
    return  ListView.builder(
      itemCount: favouriteMeals.length,
      itemBuilder: (context, index) {
        return Container(
          child: MealItem(
            id: favouriteMeals[index].id,
            title: favouriteMeals[index].title,
            imageUrl: favouriteMeals[index].imageUrl,
            duration: favouriteMeals[index].duration,
            complexity: favouriteMeals[index].complexity,
            affordability: favouriteMeals[index].affordability,
          ),
        );
      },
    );
  }
}
