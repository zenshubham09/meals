import 'package:flutter/material.dart';
import 'package:meals/Screen/CategoryMealsScreen.dart';
import 'package:meals/Screen/filtered_screen.dart';
import 'package:meals/Screen/meal_detail_screen.dart';
import 'package:meals/Screen/tabs_screen.dart';
import 'package:meals/Utilities/Route/RouteConstants.dart';
import 'package:meals/dummy_data.dart';

import 'Models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'gluten': false,
    'vegetarian': false,
    'vegan': false,
    'lactose': false
  };

  List<Meal> availableMeals = DUMMY_MEALS;
  List<Meal> favouriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      filters = filterData;

      availableMeals = DUMMY_MEALS.where((meal) {
        if (filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        if (filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void toggleFavouriteMeal(String mealId) {
    final existingIndex = favouriteMeals.indexWhere((meal) => meal.id == mealId);

    if (existingIndex >= 0) {
      favouriteMeals.removeAt(existingIndex);
    } else {
      favouriteMeals.add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
    }
  }

  bool _isMealFavourite(String id) {
    return favouriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.purple,
        canvasColor: Colors.white,
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: TextStyle(color: Color.fromRGBO(20, 21, 23, 1)),
            bodyText2: TextStyle(color: Color.fromRGBO(20, 1, 13, 1)),
            headline1: TextStyle(
                fontSize: 18,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w500)),
      ),
      initialRoute: RouteConstants.defaultRoute, // Default routing
      routes: {
        /// to set default or initial route , no need to define identifier

        RouteConstants.defaultRoute: (context) => TabsScreen(favouriteMeals), // Default Route
        RouteConstants.categoryMeals: (context) =>
            CategoryMealsScreen(availableMeals),
        RouteConstants.mealDetail: (context) => MealDetailScreen(toggleFavouriteMeal, _isMealFavourite),
        RouteConstants.filteredScreenRoute: (context) =>
            FilteredScreen(filters ,_setFilters),
      },
      onGenerateRoute: (settings) {
        print('Route Setting: $settings');

        /// This function will execute when a unregistered route will defined.
        return MaterialPageRoute(builder: (context) => CategoryMealsScreen(availableMeals));
      },
      onUnknownRoute: (settings) {
        print('Route Name: ${settings.name}');
        print('Routes Args: ${settings.arguments}');

        /// This methods will be invoked when we did not set any default route or did not use onGenerateRoute finction
        ///  OnUnknownRoute will be the last function when no routing table available.
        return MaterialPageRoute(builder: (context) => CategoryMealsScreen(availableMeals));
      },
    );
  }
}
