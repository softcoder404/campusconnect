import 'package:campus_connect/presentation/components/notification.dart';
import 'package:campus_connect/presentation/screens/Dashboard/account/controllers/account.controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class EditAccountController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController fullNameCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();
  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController universityCtrl = TextEditingController();
  TextEditingController departmentCtrl = TextEditingController();
  TextEditingController levelCtrl = TextEditingController();

  FocusNode fullNameNode = FocusNode();
  FocusNode phoneNode = FocusNode();
  FocusNode usernameNode = FocusNode();
  FocusNode universityNode = FocusNode();
  FocusNode departmentNode = FocusNode();
  FocusNode levelNode = FocusNode();

  AccountController _accountCtrl = Get.find<AccountController>();
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void handleOnSaveChange() async {
    if (formKey.currentState!.validate()) {
      final Map<String, dynamic> _payload = {
        "department": departmentCtrl.text.trim(),
        "level": levelCtrl.text.trim(),
        "fullName": fullNameCtrl.text.trim(),
        "phone": phoneCtrl.text,
        "university": universityCtrl.text,
      };
      showCustomLoading(title: 'Updating...');
      try {
        await _firestore
            .collection('Users')
            .doc(_accountCtrl.authUser!.uid)
            .update(_payload);
        hideLoading();
        Get.back();
      } catch (err) {
        notifyError(content: err.toString());
      }
    }
  }

  @override
  void onReady() {
    fullNameCtrl.text = _accountCtrl.authUser!.fullName!;
    usernameCtrl.text = _accountCtrl.authUser!.username!;
    phoneCtrl.text = _accountCtrl.authUser!.phone!;
    levelCtrl.text = _accountCtrl.authUser!.level!;
    departmentCtrl.text = _accountCtrl.authUser!.department!;
    universityCtrl.text = _accountCtrl.authUser!.university!;
    super.onReady();
  }
}
