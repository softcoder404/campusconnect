
import 'package:campus_connect/presentation/config/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArrowBack extends StatelessWidget {
  const ArrowBack({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: Get.back,
      icon: Icon(
        Icons.arrow_back_ios,
        color: white,
      ),
    );
  }
}