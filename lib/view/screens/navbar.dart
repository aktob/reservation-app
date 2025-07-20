import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:reservation_app/view/screens/home.dart';
import 'package:reservation_app/view/screens/orders.dart';
import 'package:reservation_app/view/screens/profile.dart';
import 'package:reservation_app/view/screens/services.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final PageController _pageController = PageController(initialPage: 3);
  int _currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          ProfilePage(),
          ServicesPage(),
          OrderPage(),
          HomePage(),

        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.brown,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'المزيد',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.support_agent),
            label: 'الدعم',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'طلباتي',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'الرئيسية',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.jumpToPage(index);
          });
        },
      ),
    );
  }
}