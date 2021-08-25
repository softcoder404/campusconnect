import 'dart:io';

import 'package:campus_connect/core/Prefs/shared_preference_service.dart';
import 'package:campus_connect/core/services/Firebase/user.service.dart';
import 'package:campus_connect/presentation/components/notification.dart';
import 'package:campus_connect/presentation/screens/Dashboard/dashboard_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class CompleteProfileController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController userNameCtrl = TextEditingController();
  TextEditingController fullNameCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();
  FocusNode phoneNode = FocusNode();

  TextEditingController schoolCtrl = TextEditingController();
  TextEditingController departmentCtrl = TextEditingController();
  TextEditingController levelCtrl = TextEditingController();
  FocusNode userNameNode = FocusNode();
  FocusNode fullNameNode = FocusNode();

  FocusNode schoolNode = FocusNode();
  FocusNode departmentNode = FocusNode();
  FocusNode levelNode = FocusNode();
  final ImagePicker _imagePicker = ImagePicker();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String _profileUrl =
      "https://eu.ui-avatars.com/api/?background=random&name=Username";
  String get imageUrl => _profileUrl;
  File? _selectedImageFile;
  set imageUrl(String url) {
    _profileUrl = url;
    update();
  }

  void handleSubmitForm() async {
    if (formKey.currentState!.validate()) {
      final User? _authUser = _firebaseAuth.currentUser;
      final _payload = {
        "uid": _authUser!.uid,
        "phone": phoneCtrl.text,
        "fullName": fullNameCtrl.text.trim(),
        "username": userNameCtrl.text.trim(),
        "university": schoolCtrl.text.trim(),
        "profileUrl": _profileUrl,
        "department": departmentCtrl.text.trim(),
        "level": levelCtrl.text.trim()
      };
      showCustomLoading(title: 'checking username');
      final result = await UserService.createNewUser(_payload);

      if (result.hasError) {
        hideLoading();
        notifyInfo(content: result.message);
      } else {
        notifySuccess(content: result.message);
        await Pref.setCompleteReg(true);
        hideLoading();
        Get.offNamedUntil(DashboardView.route, (route) => false);
      }
    }
  }

  Future<void> handleOnChangeImage() async {
    XFile? _pickedImage =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (_pickedImage != null) {
      _selectedImageFile = File(_pickedImage.path);
      await uploadImageFile(_selectedImageFile!);
    } else {
      notifyError(content: 'No image picked!');
    }
  }

  Future<void> uploadImageFile(File file) async {
    String fileName = basename(file.path);
    showCustomLoading(title: 'Updating Profile Image');
    final Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('profile/$fileName');

    UploadTask uploadTask = firebaseStorageRef.putFile(file);
    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
    final errorSnapshot = await uploadTask
        .onError((error, stackTrace) => notifyError(content: error.toString()));
    taskSnapshot.ref.getDownloadURL().then(
      (value) {
        hideLoading();
        _profileUrl = value;
        update();
      },
    );
  }
}
