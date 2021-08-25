import 'package:campus_connect/core/Prefs/shared_preference_service.dart';
import 'package:campus_connect/presentation/components/notification.dart';
import 'package:campus_connect/presentation/config/themes/colors.dart';
import 'package:campus_connect/presentation/screens/Auth/views/complete_registration_view.dart';
import 'package:campus_connect/presentation/screens/Dashboard/dashboard_view.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class RegisterController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  bool showPassword = false;

  toggleShowPassword() {
    showPassword = !showPassword;
    update();
  }

  bool isRegComplete = false;

  handleAuthentication() async {
    if (formKey.currentState!.validate()) {
      try {
        if (isRegComplete) {
          //sign in and go to homepage
          showCustomLoading(title: 'Authenticating');
          final result = await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: emailCtrl.text.trim().toLowerCase(),
              password: passwordCtrl.text.trim());
          hideLoading();
          Get.offNamedUntil(DashboardView.route, (route) => false);
        } else {
          //create user and go to complete profile
          showCustomLoading(title: 'Authenticating');
          final result = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: emailCtrl.text.trim().toLowerCase(),
                  password: passwordCtrl.text.trim());
          hideLoading();
          Get.to(() => CompleteProfileView(),
              transition: Transition.leftToRight);
        }
      } catch (e) {
        Get.snackbar('Error', e.toString(),
            backgroundColor: black, colorText: white);
      }
    }
  }

  void createInWithCredential(String email, String password) async {
    showCustomLoading(title: 'Authenticating');
    try {} catch (e) {}
  }

  @override
  void onReady() async {
    // TODO: implement onReady
    isRegComplete = await Pref.isCompleteReg();
    update();
    super.onReady();
  }
}
