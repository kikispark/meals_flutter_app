import 'package:flutter/material.dart';
import '/screens/categories_screen.dart';
import '/screens/favorites_screen.dart';
import '/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = [
    {'page': CategoriesScreen(), 'title': 'Categories'},
    {'page': FavoritesScreen(), 'title': 'Your Favorites'},
  ];
  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    //The index parameter comes from the navigation bar tap.
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(228, 235, 171, 69),
        title: Text(
          _pages[_selectedPageIndex]['title'] as String,
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Color.fromARGB(228, 235, 171, 69),
        unselectedItemColor: Theme.of(context).tabBarTheme.unselectedLabelColor,
        selectedItemColor: Theme.of(context).tabBarTheme.indicatorColor,
        currentIndex: _selectedPageIndex,
        // type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );
  }
}
