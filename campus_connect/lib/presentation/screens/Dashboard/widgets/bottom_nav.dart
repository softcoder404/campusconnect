import 'package:campus_connect/presentation/config/themes/colors.dart';
import 'package:campus_connect/presentation/screens/Dashboard/dashboard.controller.dart';
import 'package:flutter/material.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final DashboardController controller;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: controller.currentTabIndex,
      selectedItemColor: white,
      unselectedItemColor: white.withOpacity(.7),
      showUnselectedLabels: true,
      selectedLabelStyle: TextStyle(
        color: white,
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
      unselectedLabelStyle: TextStyle(
        color: white,
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
      backgroundColor: black,
      onTap: controller.onNavBarChange,
      items: [
        BottomNavigationBarItem(
          backgroundColor: black,
          icon: Icon(
            Icons.home,
            color: white.withOpacity(.3),
          ),
          activeIcon: Icon(
            Icons.home,
            color: white,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          backgroundColor: black,
          icon: Icon(
            Icons.trending_up,
            color: white.withOpacity(.3),
          ),
          activeIcon: Icon(
            Icons.trending_up,
            color: white,
          ),
          label: 'Trend',
        ),
        BottomNavigationBarItem(
          backgroundColor: black,
          icon: Icon(
            Icons.store,
            color: white.withOpacity(.3),
          ),
          activeIcon: Icon(
            Icons.store,
            color: white,
          ),
          label: 'Stores',
        ),
        BottomNavigationBarItem(
          backgroundColor: black,
          icon: Icon(
            Icons.person,
            color: white.withOpacity(.3),
          ),
          activeIcon: Icon(
            Icons.person,
            color: white,
          ),
          label: 'Accounts',
        ),
      ],
    );
  }
}
