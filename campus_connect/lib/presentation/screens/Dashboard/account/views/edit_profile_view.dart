import 'package:campus_connect/core/helpers/form_validator_utils.dart';
import 'package:campus_connect/presentation/components/buttons/arrow_back_widget.dart';
import 'package:campus_connect/presentation/components/buttons/primary_button.dart';
import 'package:campus_connect/presentation/config/themes/colors.dart';
import 'package:campus_connect/presentation/config/themes/spacing.dart';
import 'package:campus_connect/presentation/config/themes/styles.dart';
import 'package:campus_connect/presentation/screens/Dashboard/account/controllers/edit_account_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditAccountView extends StatelessWidget {
  EditAccountView({Key? key}) : super(key: key);
  final EditAccountController _controller =
      Get.put<EditAccountController>(EditAccountController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: black,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: ArrowBack(),
        actions: [
          Center(
            child: Text(
              'Edit Account',
              style: kBodyText2,
            ),
          ),
          hSpaceSmall,
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: GetBuilder<EditAccountController>(
          builder: (_) => Container(
            height: screenHeight(context),
            width: screenWidth(context),
            child: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(15.0),
                child: Form(
                  key: _controller.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Edit Your Profile',
                          style: kHeadingText2,
                        ),
                      ),
                      vSpaceSmall,
                      TextFormField(
                        style: kBodyText3,
                        cursorColor: kPrimaryColor,
                        validator: validateFullName,
                        controller: _controller.fullNameCtrl,
                        focusNode: _controller.fullNameNode,
                        onEditingComplete: () => FocusScope.of(context)
                            .requestFocus(_controller.usernameNode),
                        decoration: InputDecoration(
                          hintText: 'Full Name',
                          hintStyle: kBodyText4,
                        ),
                      ),
                      vSpaceMedium,
                      TextFormField(
                        style: kBodyText3,
                        enabled: false,
                        cursorColor: kPrimaryColor,
                        controller: _controller.usernameCtrl,
                        focusNode: _controller.usernameNode,
                        validator: null,
                        onEditingComplete: () => FocusScope.of(context)
                            .requestFocus(_controller.phoneNode),
                        decoration: InputDecoration(
                          hintText: 'Username/Nickname',
                          hintStyle: kBodyText4,
                        ),
                      ),
                      vSpaceMedium,
                      TextFormField(
                        cursorColor: kPrimaryColor,
                        keyboardType: TextInputType.phone,
                        style: kBodyText2,
                        validator: validatePhone,
                        controller: _controller.phoneCtrl,
                        focusNode: _controller.phoneNode,
                        onEditingComplete: () => FocusScope.of(context)
                            .requestFocus(_controller.universityNode),
                        decoration: InputDecoration(
                          hintText: 'Phone Number e.g 07014xxx',
                          hintStyle: kBodyText4,
                        ),
                      ),
                      vSpaceMedium,
                      TextFormField(
                        style: kBodyText3,
                        cursorColor: kPrimaryColor,
                        validator: (value) => validateRequired(
                            value!, 'University',
                            minLength: 5),
                        controller: _controller.universityCtrl,
                        focusNode: _controller.universityNode,
                        onEditingComplete: () => FocusScope.of(context)
                            .requestFocus(_controller.departmentNode),
                        decoration: InputDecoration(
                          hintText: 'University',
                          hintStyle: kBodyText4,
                        ),
                      ),
                      vSpaceMedium,
                      TextFormField(
                        style: kBodyText3,
                        cursorColor: kPrimaryColor,
                        validator: (value) => validateRequired(
                            value!, 'department',
                            minLength: 6),
                        controller: _controller.departmentCtrl,
                        focusNode: _controller.departmentNode,
                        onEditingComplete: () => FocusScope.of(context)
                            .requestFocus(_controller.levelNode),
                        decoration: InputDecoration(
                          hintText: 'Department e.g Elect/Elect',
                          hintStyle: kBodyText4,
                        ),
                      ),
                      vSpaceMedium,
                      TextFormField(
                        style: kBodyText3,
                        cursorColor: kPrimaryColor,
                        validator: (value) =>
                            validateRequired(value!, 'level', minLength: 2),
                        controller: _controller.levelCtrl,
                        focusNode: _controller.levelNode,
                        onEditingComplete: () {
                          _controller.levelNode.unfocus();
                          FocusScope.of(context).unfocus();
                        },
                        decoration: InputDecoration(
                          hintText: 'Level e.g 200 Level',
                          hintStyle: kBodyText4,
                        ),
                      ),
                      vSpaceMedium,
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: PrimaryButton(
                          title: 'Save Changes',
                          onTap: () => _controller.handleOnSaveChange(),
                        ),
                      ),
                      vSpaceMedium,
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
