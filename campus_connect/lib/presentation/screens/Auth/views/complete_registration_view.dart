import 'package:cached_network_image/cached_network_image.dart';
import 'package:campus_connect/core/helpers/form_validator_utils.dart';
import 'package:campus_connect/presentation/components/buttons/arrow_back_widget.dart';
import 'package:campus_connect/presentation/components/buttons/primary_button.dart';
import 'package:campus_connect/presentation/config/themes/colors.dart';
import 'package:campus_connect/presentation/config/themes/spacing.dart';
import 'package:campus_connect/presentation/config/themes/styles.dart';
import 'package:campus_connect/presentation/screens/Auth/controllers/complete_profile_controller.dart';
import 'package:campus_connect/presentation/screens/Dashboard/widgets/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteProfileView extends StatelessWidget {
  CompleteProfileView({Key? key}) : super(key: key);
  static final String route = "/completeProfile";
  final CompleteProfileController _controller =
      Get.put<CompleteProfileController>(CompleteProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: transparent,
        leading: ArrowBack(),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'Complete Profile',
              style: kBodyText1,
            ),
          )
        ],
      ),
      body: GetBuilder<CompleteProfileController>(
        builder: (_) => SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: SizedBox(
            width: double.infinity,
            child: Form(
              key: _controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  vSpaceMedium,
                  ProfileImageWidget(
                    radius: 70,
                    imageUrl: _controller.imageUrl,
                    onTap: _controller.handleOnChangeImage,
                  ),
                  vSpaceLarge,
                  TextFormField(
                    controller: _controller.fullNameCtrl,
                    focusNode: _controller.fullNameNode,
                    style: kBodyText1,
                    validator: (value) => validateRequired(value!, 'Full Name'),
                    onEditingComplete: () => FocusScope.of(context)
                        .requestFocus(_controller.phoneNode),
                    decoration: InputDecoration(
                      hintText: 'FullName',
                      hintStyle:
                          kBodyText1.copyWith(color: white.withOpacity(.7)),
                    ),
                  ),
                  vSpaceMedium,
                  TextFormField(
                    controller: _controller.phoneCtrl,
                    focusNode: _controller.phoneNode,
                    style: kBodyText1,
                    validator: validatePhone,
                    keyboardType: TextInputType.phone,
                    onEditingComplete: () => FocusScope.of(context)
                        .requestFocus(_controller.userNameNode),
                    decoration: InputDecoration(
                      hintText: 'Phone',
                      hintStyle:
                          kBodyText1.copyWith(color: white.withOpacity(.7)),
                    ),
                  ),
                  vSpaceMedium,
                  TextFormField(
                    controller: _controller.userNameCtrl,
                    focusNode: _controller.userNameNode,
                    style: kBodyText1,
                    validator: (value) =>
                        validateRequired(value!, 'Username/Nickname'),
                    onEditingComplete: () => FocusScope.of(context)
                        .requestFocus(_controller.schoolNode),
                    decoration: InputDecoration(
                      hintText: 'Username/Nickname',
                      hintStyle:
                          kBodyText1.copyWith(color: white.withOpacity(.7)),
                    ),
                  ),
                  vSpaceMedium,
                  TextFormField(
                    style: kBodyText1,
                    controller: _controller.schoolCtrl,
                    focusNode: _controller.schoolNode,
                    validator: (value) =>
                        validateRequired(value!, 'University'),
                    onEditingComplete: () => FocusScope.of(context)
                        .requestFocus(_controller.departmentNode),
                    decoration: InputDecoration(
                      hintText: 'University',
                      hintStyle:
                          kBodyText1.copyWith(color: white.withOpacity(.7)),
                    ),
                  ),
                  vSpaceMedium,
                  TextFormField(
                    style: kBodyText1,
                    controller: _controller.departmentCtrl,
                    focusNode: _controller.departmentNode,
                    validator: (value) =>
                        validateRequired(value!, 'Department'),
                    onEditingComplete: () => FocusScope.of(context)
                        .requestFocus(_controller.levelNode),
                    decoration: InputDecoration(
                      hintText: 'Department',
                      hintStyle:
                          kBodyText1.copyWith(color: white.withOpacity(.7)),
                    ),
                  ),
                  vSpaceMedium,
                  TextFormField(
                    style: kBodyText1,
                    controller: _controller.levelCtrl,
                    focusNode: _controller.levelNode,
                    validator: (value) => validateRequired(value!, 'Level'),
                    onEditingComplete: () {
                      _controller.departmentNode.unfocus();
                      FocusScope.of(context).unfocus();
                    },
                    decoration: InputDecoration(
                      hintText: 'Level',
                      hintStyle:
                          kBodyText1.copyWith(color: white.withOpacity(.7)),
                    ),
                  ),
                  vSpaceLarge,
                  PrimaryButton(
                    title: 'Submit',
                    height: 55,
                    width: double.infinity,
                    onTap: _controller.handleSubmitForm,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
