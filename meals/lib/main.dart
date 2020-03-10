import 'package:flutter/material.dart';
import 'package:meals/Screen/CategoryMealsScreen.dart';
import 'package:meals/Screen/meal_detail_screen.dart';
import 'package:meals/Utilities/Route/RouteConstants.dart';
import 'package:meals/Screen/caragories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
      initialRoute: '/', // Default routing
      routes: {
        /// to set default or initial route , no need to define identifier

        '/': (context) => CategoriesScreen(), // Default Route
        RouteConstants.categoryMeals: (context) => CategoryMealsScreen(),
        RouteConstants.mealDetail: (context) => MealDetailScreen(),
      },
      onGenerateRoute: (settings) {
        print('Route Setting: $settings');
        /// This function will execute when a unregistered route will defined.
        return MaterialPageRoute(builder: (context) => CategoryMealsScreen());
      },
      onUnknownRoute: (settings) {

        print('Route Name: ${settings.name}');
        print('Routes Args: ${settings.arguments}');

        /// This methods will be invoked when we did not set any default route or did not use onGenerateRoute finction
        ///  OnUnknownRoute will be the last function when no routing table available.
        return MaterialPageRoute(builder: (context) => CategoryMealsScreen());
      },
    );
  }
}
