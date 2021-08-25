import 'package:campus_connect/presentation/config/themes/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LinkableTextButton extends StatelessWidget {
  const LinkableTextButton({
    Key? key,
    this.onTap,
    this.linkText,
    this.text,
  }) : super(key: key);
  final void Function()? onTap;
  final String? text;
  final String? linkText;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: text ?? 'Want to be a member',
          style: kBodyText3,
          children: [
            TextSpan(
                recognizer: TapGestureRecognizer()..onTap = onTap,
                text: linkText ?? ' Signup',
                style: kBodyText3.copyWith(color: Colors.redAccent))
          ]),
    );
  }
}
