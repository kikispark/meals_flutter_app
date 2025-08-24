import 'package:flutter/material.dart';
import '/screens/tabs_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/category_meals_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/filters_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepOrange,
        ).copyWith(secondary: Colors.amber),
        canvasColor: Color.fromRGBO(203, 203, 191, 1),

        appBarTheme: AppBarTheme(iconTheme: IconThemeData(color: Colors.white)),
        tabBarTheme: TabBarThemeData(
          labelColor: Colors.white, // selected tab text
          unselectedLabelColor: Colors.white70, // unselected tab text
          indicatorColor: Colors.white, // underline color
          indicatorSize: TabBarIndicatorSize.tab, // underline width
        ),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyLarge: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          bodyMedium: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          titleLarge: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      // home: CategoriesScreen(),
      initialRoute: '/', // Default route
      routes: {
        '/': (ctx) => TabsScreen(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(),
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        return MaterialPageRoute(
          //Think of it as:
          // A "road" (route) from one screen (widget) to another.
          // It tells Flutter which widget to show and how the transition animation looks (slide from right to left on Android, fade on iOS, etc.).
          builder: (ctx) => CategoriesScreen(),
        );
      },
      // onUnknownRoute: () {},
    );
  }
}
//exemple of dynamic id route :
// MaterialApp(
//   onGenerateRoute: (settings) {
//     // Check which route we are navigating to
//     if (settings.name == '/profile') {
//       // Extract the ID passed as an argument
//       final userId = settings.arguments as String;

//       // Return a MaterialPageRoute with the ProfileScreen
//       return MaterialPageRoute(
//         builder: (_) => ProfileScreen(userId: userId),
//       );
//     }

//     // Default route
//     return MaterialPageRoute(builder: (_) => HomeScreen());
//   },
// );
