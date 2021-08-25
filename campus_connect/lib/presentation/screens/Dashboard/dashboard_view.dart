import 'package:campus_connect/presentation/config/themes/colors.dart';
import 'package:campus_connect/presentation/screens/Dashboard/account/controllers/account.controller.dart';
import 'package:campus_connect/presentation/screens/Dashboard/dashboard.controller.dart';
import 'package:campus_connect/presentation/screens/Dashboard/home/controllers/home_controller.dart';
import 'package:campus_connect/presentation/screens/Dashboard/home/views/trend_view.dart';
import 'package:campus_connect/presentation/screens/Dashboard/store/controller/store_controller.dart';
import 'package:campus_connect/presentation/screens/Dashboard/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'account/views/account_view.dart';
import 'home/views/home_view.dart';
import 'store/views/store_view.dart';

class DashboardView extends StatelessWidget {
  DashboardView({Key? key}) : super(key: key);
  static final String route = '/dashboard';
  final DashboardController controller =
      Get.put(DashboardController(), permanent: true);
  final AccountController accountCtrl =
      Get.put(AccountController(), permanent: true);
  final StoreController storeCtrl =
      Get.put<StoreController>(StoreController(), permanent: true);
  final HomeController homeCtrl =
      Get.put<HomeController>(HomeController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) => Scaffold(
        backgroundColor: black,
        body: PageView(
          onPageChanged: controller.onNavBarChange,
          controller: controller.pageController,
          children: [
            HomeView(),
            TrendView(),
            StoreView(),
            AccountView(),
          ],
        ),
        bottomNavigationBar: BottomNavBarWidget(
          controller: controller,
        ),
      ),
    );
  }
}
