import 'package:SIKOMPAK/screens/catalog/product_view.dart';
import 'package:SIKOMPAK/screens/pages/home_page.dart';
import 'package:SIKOMPAK/screens/videos/home_videos.dart';
import 'package:custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:custom_bottom_navigation_bar/custom_bottom_navigation_bar_item.dart';
import 'package:flutter/services.dart';

const Color PRIMARY_COLOR = Colors.green;
const Color BACKGROUND_COLOR = Color(0xffE2E7F2);

class Navigation extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavigationBar(),
    );
  }
}

class NavigationBar extends StatefulWidget {
  final Color backgroundColor;
  final Color itemColor;
  // final List<NavigationItem> children;
  final Function(int) onChange;
  final int currentIndex;

  NavigationBar(
      {this.backgroundColor = BACKGROUND_COLOR,
      this.itemColor = PRIMARY_COLOR,
      this.currentIndex = 0,
      // @required this.children,
      this.onChange});

  @override
  // State<StatefulWidget> createState() {
  //   return NavigationBarState();
  NavigationBarState createState() => NavigationBarState();
}

class NavigationBarState extends State<NavigationBar> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeVideos(),
    Product(),
    HomePage(),
  ];
  // final PageController _pageController = PageController();
  // PageController _pageController = PageController();

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        backgroundColor: Colors.green,
        itemBackgroudnColor: Colors.black,
        onTap: onTappedBar,
        // currentIndex: _currentIndex,
        items: [
          CustomBottomNavigationBarItem(
            icon: Icons.home,
            title: "Home",
          ),
          CustomBottomNavigationBarItem(
            icon: Icons.people,
            title: "SIKOMPAK",
          ),
          CustomBottomNavigationBarItem(
            icon: Icons.payment,
            title: "Product",
          ),
        ],
      ),
    );
  }
}
