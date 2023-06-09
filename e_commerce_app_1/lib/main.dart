import 'pages/cart.dart';
import 'pages/explore.dart';
import 'pages/notification.dart';
import 'pages/profile.dart';
import 'pages/search.dart';
// import 'package:flashy_tab_bar/flashy_tab_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  int _selectedPage = 0;

  List<Widget> pages = [ExplorePage(), SearchPage(), CartPage(), ProfilePage()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedPage = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _pageController = PageController(initialPage: 0);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          onPageChanged: (index) => setState(() {
            _selectedPage = index;
          }),
          controller: _pageController,
          children: [...pages],
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: _onItemTapped,
          items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, size: 23), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.search, size: 23), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined, size: 23), label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle_outlined,
                size: 23,
              ),
              label: 'Profile'),
        ]));
  }
}
