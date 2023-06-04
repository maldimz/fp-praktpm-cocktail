import 'package:cocktail_fp/pages/home_page.dart';
import 'package:cocktail_fp/pages/saved_page.dart';
import 'package:cocktail_fp/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBar();
}

class _BottomNavBar extends State<BottomNavBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Homepage(),
    SearchPage(),
    SavedPage()
  ];

  void _onItemTapped(int index) async {
    await SharedPreferences.getInstance().then((prefs) {
      prefs.setInt('nav', index);
    });
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> getIndex() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var indexNav = prefs.getInt('nav');
    if (indexNav == null) {
      indexNav = 0;
    }
    setState(() {
      _selectedIndex = indexNav!;
    });
  }

  @override
  void initState() {
    super.initState();
    getIndex();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: ""),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
