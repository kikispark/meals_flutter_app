import 'package:flutter/material.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealsScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'] as String;
    final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    //==> DUMMY_MEALS is a list of all meals, and we filter it to get only those that belong to the selected category, for example if u choose summer category it filter the c10 in each item of list and return only those that have c10 in their categories list.
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        backgroundColor: Theme.of(context).primaryColor, // Use theme color
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Text(categoryMeals[index].title);
        },
        itemCount: categoryMeals
            .length, //==> Without itemCount, ListView.builder could keep calling itemBuilder forever → giving you an infinite list.
        //Flutter will build exactly as many items as there are meals in categoryMeals
      ),
    );
  }
}
