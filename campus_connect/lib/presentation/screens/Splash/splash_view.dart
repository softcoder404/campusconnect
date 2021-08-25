import 'package:campus_connect/presentation/components/buttons/primary_button.dart';
import 'package:campus_connect/presentation/config/themes/colors.dart';
import 'package:campus_connect/presentation/config/themes/spacing.dart';
import 'package:campus_connect/presentation/config/themes/styles.dart';
import 'package:campus_connect/presentation/screens/Auth/views/register_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);
  static String route = '/splash';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: black,
      body: Container(
        height: screenHeight(context),
        width: screenWidth(context),
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Image.asset(
              'assets/images/splash.png',
              height: 200,
              width: 200,
              fit: BoxFit.fill,
            ),
            vSpaceSmall,
            Text(
              'Connect easily with your friends within and outside school campus',
              style: kSubheading.copyWith(
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            Spacer(),
            Text(
              'Terms & Privacy Policy',
              style: kBodyText2,
            ),
            vSpaceMedium,
            PrimaryButton(
              width: double.infinity,
              height: 55,
              title: 'Start Connecting',
              onTap: () => Get.toNamed(RegisterView.route),
            ),
            vSpaceMedium,
          ],
        ),
      ),
    );
  }
}
