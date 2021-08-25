import 'package:campus_connect/core/helpers/form_validator_utils.dart';
import 'package:campus_connect/presentation/components/buttons/arrow_back_widget.dart';
import 'package:campus_connect/presentation/components/buttons/primary_button.dart';
import 'package:campus_connect/presentation/config/themes/colors.dart';
import 'package:campus_connect/presentation/config/themes/spacing.dart';
import 'package:campus_connect/presentation/config/themes/styles.dart';
import 'package:campus_connect/presentation/screens/Auth/controllers/register.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterView extends StatelessWidget {
  RegisterView({Key? key}) : super(key: key);
  static final String route = '/register';
  final RegisterController _controller =
      Get.put<RegisterController>(RegisterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: black,
      appBar: AppBar(
        leading: ArrowBack(),
        backgroundColor: transparent,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        height: screenHeight(context),
        width: screenWidth(context),
        child: GetBuilder<RegisterController>(
          builder: (_) => Form(
            key: _controller.formKey,
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Text(
                  _controller.isRegComplete
                      ? 'Welcome Back!'
                      : 'Setup Your Account',
                  style: kSubheading,
                ),
                vSpaceSmall,
                Text(
                  _controller.isRegComplete
                      ? 'Login into your account with your credential'
                      : 'Please enter a valid email address and password for authentication',
                  style: kBodyText2.copyWith(color: white),
                ),
                vSpaceMedium,
                TextFormField(
                  style: kBodyText2,
                  keyboardType: TextInputType.emailAddress,
                  validator: validateEmail,
                  controller: _controller.emailCtrl,
                  decoration: InputDecoration(
                      hintText: 'Email Address',
                      hintStyle:
                          kBodyText4.copyWith(color: white.withOpacity(.7))),
                ),
                vSpaceMedium,
                TextFormField(
                  style: kBodyText2,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: !_controller.showPassword,
                  validator: validatePassword,
                  controller: _controller.passwordCtrl,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(_controller.showPassword
                          ? Icons.lock_open
                          : Icons.lock),
                      onPressed: _controller.toggleShowPassword,
                    ),
                    hintText: 'Password',
                    hintStyle:
                        kBodyText4.copyWith(color: white.withOpacity(.7)),
                  ),
                ),
                vSpaceLarge,
                PrimaryButton(
                  title: 'Continue',
                  width: double.infinity,
                  height: 55,
                  onTap: _controller.handleAuthentication,
                ),
                vSpaceSmall,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
