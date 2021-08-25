import 'package:campus_connect/presentation/config/themes/colors.dart';
import 'package:campus_connect/presentation/config/themes/styles.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    this.onTap,
    this.title,
    this.bgColor,
    this.txtColor,
    this.height,
    this.width,
  }) : super(key: key);
  final void Function()? onTap;
  final String? title;
  final Color? bgColor;
  final Color? txtColor;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 40,
      width: width ?? 220,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateColor.resolveWith(
              (states) => bgColor ?? kPrimaryColor),
          shape: MaterialStateProperty.resolveWith(
            (states) => RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
              25.0,
            )),
          ),
        ),
        onPressed: onTap,
        child: Text(
          title ?? 'Continue',
          style: kButtonTextStyle.copyWith(
              color: txtColor ?? white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
