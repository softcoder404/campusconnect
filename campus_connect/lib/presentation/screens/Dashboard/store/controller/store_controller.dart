import 'dart:io';

import 'package:campus_connect/core/models/store_product_model.dart';
import 'package:campus_connect/presentation/components/notification.dart';
import 'package:campus_connect/presentation/config/themes/colors.dart';
import 'package:campus_connect/presentation/screens/Dashboard/account/controllers/account.controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class StoreController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController priceCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();
  TextEditingController locationCtrl = TextEditingController();
  FocusNode nameNode = FocusNode();
  FocusNode priceNode = FocusNode();
  FocusNode phoneNode = FocusNode();
  FocusNode locationNode = FocusNode();
  AccountController _accountController = Get.find<AccountController>();
  final ImagePicker _imagePicker = ImagePicker();
  String? _selectedProductUrl;
  List<StoreProductModel> _storeProductList = [];
  List<StoreProductModel> get storeProducts => _storeProductList;
  String? get selectedProductUrl => _selectedProductUrl;

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void postProduct() async {
    if (formKey.currentState!.validate() && _selectedProductUrl != null) {
      StoreProductModel _storeProduct = StoreProductModel(
        imageUrl: _selectedProductUrl,
        name: nameCtrl.text.trim(),
        price: priceCtrl.text.trim(),
        location: locationCtrl.text.trim(),
        phone: phoneCtrl.text.trim(),
        timestamp: DateTime.now().toString(),
        ownerUsername: _accountController.authUser!.username,
      );
      showCustomLoading(title: 'Posting product...');
      try {
        await _firestore.collection('Stores').doc().set(_storeProduct.toJson());
        hideLoading();
        Get.back();
      } catch (err) {
        notifyInfo(content: err.toString());
      }
    } else {
      notifyError(content: 'Select Product Image and enter all details');
    }
  }

  @override
  void onReady() {
    listenToStoreProduct();
    super.onReady();
  }

  void listenToStoreProduct() async {
    try {
      _firestore.collection('Stores').snapshots().listen((storeDoc) {
        _storeProductList.clear();
        storeDoc.docs.forEach((store) {
          _storeProductList
              .add(StoreProductModel.fromJson(store.data(), store.id));
        });
        update();
      });
    } catch (error) {
      notifyError(content: error.toString());
    }
  }

  Future<void> handleOnAddImage() async {
    XFile? _addedProduct =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (_addedProduct != null) {
      await uploadImageFile(File(_addedProduct.path));
    } else {
      notifyError(content: 'No image picked!');
    }
  }

  Future<void> uploadImageFile(File file) async {
    String fileName = basename(file.path);
    showCustomLoading(title: 'selecting product image...');
    final Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('stores/$fileName');

    UploadTask uploadTask = firebaseStorageRef.putFile(file);
    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
    final errorSnapshot = await uploadTask
        .onError((error, stackTrace) => notifyError(content: error.toString()));
    taskSnapshot.ref.getDownloadURL().then(
      (value) {
        hideLoading();
        _selectedProductUrl = value;
        update();
      },
    );
  }

  void callSeller(String phone) async {
    bool? res = await FlutterPhoneDirectCaller.callNumber(phone);
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
}
