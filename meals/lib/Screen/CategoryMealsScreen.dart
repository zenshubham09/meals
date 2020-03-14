import 'package:flutter/material.dart';
import 'package:meals/Widgets/Category_item.dart';
import 'package:meals/Widgets/meal_item.dart';

import '../Models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
/*
  This is also a option to pass data using constructor

  final String categoryId;
  final String categoryTitle;
  CategoryMealsScreen(this.categoryId, this.categoryTitle);
 */

  List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String title;
  List<Meal> displayedMeals;
  var _isdataLoaded = false;

  @override
  void didChangeDependencies() {
    if (!_isdataLoaded) {
      final routesArgs =
          ModalRoute.of(context).settings.arguments as CategoryItem;
      title = routesArgs.title;
      final categoryId = routesArgs.id;

      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _isdataLoaded = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((result) => result.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
//    final routesArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: displayedMeals.length,
          itemBuilder: (context, index) {
            return Container(
              child: MealItem(
                id: displayedMeals[index].id,
                title: displayedMeals[index].title,
                imageUrl: displayedMeals[index].imageUrl,
                duration: displayedMeals[index].duration,
                complexity: displayedMeals[index].complexity,
                affordability: displayedMeals[index].affordability,
                removeItem: _removeMeal,
              ),
            );
          },
        ),
      ),
    );
  }
}
