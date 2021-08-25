import 'package:campus_connect/presentation/components/notification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class DashboardController extends GetxController {
  int currentTabIndex = 2;
  PageController _controller = PageController(initialPage: 2);
  PageController get pageController => _controller;

  void onNavBarChange(int index) {
    //update current tab index when clicked

    _controller.animateToPage(index,
        duration: Duration(milliseconds: 50), curve: Curves.bounceIn);
    currentTabIndex = index;
    update();
  }
}
