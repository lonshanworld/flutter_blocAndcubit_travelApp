import "package:flutter/material.dart";
import 'package:travel_app_bloc_and_cubit/screens/nav_screens/bar_item_screen.dart';
import 'package:travel_app_bloc_and_cubit/screens/home_screen.dart';
import 'package:travel_app_bloc_and_cubit/screens/nav_screens/my_screen.dart';
import 'package:travel_app_bloc_and_cubit/screens/nav_screens/search_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int _currentIndex = 0;
  final List _pages = [
    const HomeScreen(),
    const BarItemScreen(),
    const SearchScreen(),
    const MyScreen(),
  ];

  void _onTap(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    final deviceHeight = MediaQuery.of(context).size.height;
    final oneUnitHeight = deviceHeight/781.091;

    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: SizedBox(
        height: oneUnitHeight * 70,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: _onTap,
          currentIndex: _currentIndex,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey.withOpacity(0.6),
          backgroundColor: Colors.white,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.apps),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart_rounded),
              label: "Bar",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Me",
            ),
          ],
        ),
      ),
    );
  }
}
