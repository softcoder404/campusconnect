import 'dart:io';

import 'package:campus_connect/core/models/user_model.dart';
import 'package:campus_connect/presentation/components/notification.dart';
import 'package:campus_connect/presentation/config/themes/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class AccountController extends GetxController {
  UserModel? _authUser;
  UserModel? get authUser => _authUser;
  String _contactUsNumber = '09056195819';
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController newPwdCtrl = TextEditingController();
  TextEditingController cPwdCtrl = TextEditingController();

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final ImagePicker _imagePicker = ImagePicker();
  String? _selectedProfileImage;

  void onTalkToUs() async {
    bool? res = await FlutterPhoneDirectCaller.callNumber(_contactUsNumber);
    print('debug dialer response: $res'); //remove later
    if (res == null || !res) {
      Get.snackbar(
        'Error!',
        'Unable to open your phone dialer',
        backgroundColor: black,
        colorText: white,
      );
    }
  }

  @override
  void onInit() {
    // TODO: implement onReady
    listenToAuthUser();
    super.onReady();
  }

  void listenToAuthUser() {
    _firestore
        .collection('Users')
        .doc(_firebaseAuth.currentUser!.uid)
        .snapshots()
        .listen((event) {
      print('User event occur');
      _authUser = UserModel.fromJson(event.data()!);
      update();
    });
  }

  Future<void> handleChangeProfileImage() async {
    XFile? _chooseProfileImage =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (_chooseProfileImage != null) {
      await uploadImageFile(File(_chooseProfileImage.path));
    } else {
      notifyError(content: 'No image picked!');
    }
  }

  Future<void> uploadImageFile(File file) async {
    String fileName = basename(file.path);
    showCustomLoading(title: 'selecting image...');
    final Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('profile/$fileName');

    UploadTask uploadTask = firebaseStorageRef.putFile(file);
    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
    final errorSnapshot = await uploadTask
        .onError((error, stackTrace) => notifyError(content: error.toString()));
    taskSnapshot.ref.getDownloadURL().then(
      (value) async {
        await _firestore
            .collection('Users')
            .doc(_authUser!.uid)
            .update({'profileUrl': value});
        hideLoading();
        update();
      },
    );
  }

  logout() async {
    showCustomLoading(title: 'Logging Out...');
    await Future.delayed(Duration(seconds: 4));
    hideLoading();
    Get.offAllNamed('/login');
  }
}
