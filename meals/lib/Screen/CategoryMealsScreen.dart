import 'package:flutter/material.dart';
import 'package:meals/Widgets/Category_item.dart';
import 'package:meals/Widgets/meal_item.dart';
import 'package:meals/dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
/*
  This is also a option to pass data using constructor

  final String categoryId;
  final String categoryTitle;
  CategoryMealsScreen(this.categoryId, this.categoryTitle);
 */

  @override
  Widget build(BuildContext context) {
//    final routesArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;

    final routesArgs =
        ModalRoute.of(context).settings.arguments as CategoryItem;
    final title = routesArgs.title;
    final categoryId = routesArgs.id;

    final selectedCategoryMeal = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: selectedCategoryMeal.length,
          itemBuilder: (context, index) {
            return Container(
              child: MealItem(
                id: selectedCategoryMeal[index].id,
                title: selectedCategoryMeal[index].title,
                imageUrl: selectedCategoryMeal[index].imageUrl,
                duration: selectedCategoryMeal[index].duration,
                complexity: selectedCategoryMeal[index].complexity,
                affordability: selectedCategoryMeal[index].affordability,
              ),
            );
          },
        ),
      ),
    );
  }
}
