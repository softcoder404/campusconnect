import 'dart:io';

import 'package:campus_connect/core/models/tweet_model.dart';
import 'package:campus_connect/core/models/user_model.dart';
import 'package:campus_connect/presentation/components/notification.dart';
import 'package:campus_connect/presentation/screens/Dashboard/account/controllers/account.controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class HomeController extends GetxController {
  List<TweetModel> _tweetList = [];

  List<TweetModel> get tweetList => _tweetList;

  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  TextEditingController tweetCtrl = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _onTweet = false;
  bool get onTweet => _onTweet;
  bool _onAddImage = false;
  bool get onAddImage => _onAddImage;
  String? _addedTweetImagePath;
  String? _tweetImageUrl;
  AccountController _accountController = Get.find<AccountController>();

  String? get addedTweetImagePath => _addedTweetImagePath;
  final ImagePicker _imagePicker = ImagePicker();
  set onTweet(bool state) {
    _onTweet = state;
    update();
  }

  getTweetListStream() async {
    showLoading();
    _firestore
        .collection('Tweets')
        .orderBy('timeStamp', descending: true)
        .snapshots()
        .listen((event) {
      _tweetList.clear();
      event.docs.forEach((tweet) {
        _tweetList.add(TweetModel.fromJson(tweet.data(), tweet.id));
      });

      update();
    });
    hideLoading();
  }

  void handleTweet() async {
    if (formKey.currentState!.validate()) {
      Map<String, dynamic> _payload = {
        "hasImage": onAddImage,
        "likesCount": 0,
        "retweetCount": 0,
        "timeStamp": DateTime.now().toString(),
        "tweetImageUrl": _tweetImageUrl ??
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwYD-Q1AqXYhnvBK3X3WHvtKjx3IaUReHjPg&usqp=CAU',
        "tweet": tweetCtrl.text.trim(),
        "tweeterProfileUrl": _accountController.authUser!.profileUrl,
        "tweeterUsername": _accountController.authUser!.username,
      };
      try {
        showCustomLoading(title: 'Submitting Tweet!');
        await _firestore.collection('Tweets').doc().set(_payload);
        hideLoading();
        notifySuccess(content: 'success!');

        _onTweet = false;
        _onAddImage = false;
        update();
      } catch (err) {
        notifyInfo(content: err.toString());
      }
    } else {
      notifyInfo(content: 'Add a tweet!');
    }
  }

  void likeTweet(String uid) async {
    try {
      await _firestore
          .collection('Tweets')
          .doc(uid)
          .update({"likesCount": FieldValue.increment(1)});
    } catch (err) {
      notifyInfo(content: err.toString());
    }
  }

  void retweet(String uid) async {
    print('retweet click on $uid');
    try {
      await _firestore
          .collection('Tweets')
          .doc(uid)
          .update({"retweetCount": FieldValue.increment(1)});
    } catch (err) {
      notifyInfo(content: err.toString());
    }
  }

  Future<void> handleOnAddImage() async {
    XFile? _addedTweetImage =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (_addedTweetImage != null) {
      _addedTweetImagePath = _addedTweetImage.path;
      update();
      await uploadImageFile(File(_addedTweetImage.path));
      _onAddImage = true;
      update();
    } else {
      notifyError(content: 'No image picked!');
    }
  }

  Future<void> uploadImageFile(File file) async {
    String fileName = basename(file.path);
    showCustomLoading(title: 'adding image...');
    final Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('tweets/$fileName');

    UploadTask uploadTask = firebaseStorageRef.putFile(file);
    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
    final errorSnapshot = await uploadTask
        .onError((error, stackTrace) => notifyError(content: error.toString()));
    taskSnapshot.ref.getDownloadURL().then(
      (value) {
        hideLoading();
        _tweetImageUrl = value;
        update();
      },
    );
  }

  @override
  void onInit() {
    // TODO: implement onReady
    getTweetListStream();
    super.onReady();
  }
}
