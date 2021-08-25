// spacing
import 'package:flutter/material.dart';

import 'colors.dart';

const kAppMargin = 20.0;
const kAppPadding = 10.0;

// typography

// button text
const kButtonTextStyle = TextStyle(
    fontFamily: 'JosefinSlab',
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    color: Colors.white);

const kHeader = TextStyle(
  color: Colors.white,
  fontSize: 30.0,
  fontFamily: 'Overpass',
  height: 1.5,
);

const kSubheading = TextStyle(
  color: Colors.white,
  fontSize: 24.0,
  fontFamily: 'JosefinSlab',
  height: 1.5,
);

// header text
const kHeadingText1 = TextStyle(
    fontSize: 26.0,
    fontFamily: 'Overpass',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    color: kPrimaryTextColor);
const kHeadingText2 = TextStyle(
    fontSize: 18.0,
    fontFamily: 'Overpass',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    color: kPrimaryTextColor);
const kHeadingText3 = TextStyle(
    fontSize: 15.0,
    fontFamily: 'Overpass',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    color: kPrimaryTextColor);
const kHeadingText4 = TextStyle(
    fontSize: 13.0,
    fontFamily: 'Overpass',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    color: kPrimaryTextColor);
TextStyle kStartupStyle = TextStyle(
  fontFamily: 'JosefinSlab',
  fontSize: 32,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

// body text
const kBodyText1 = TextStyle(
    fontSize: 18.0,
    fontFamily: 'JosefinSlab',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    color: kPrimaryTextColor);
const kBodyText2 = TextStyle(
    fontSize: 16.0,
    fontFamily: 'JosefinSlab',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    color: kPrimaryTextColor);
const kBodyText3 = TextStyle(
    fontSize: 14.0,
    fontFamily: 'JosefinSlab',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    color: kPrimaryTextColor);
const kBodyText4 = TextStyle(
    fontSize: 13.0,
    fontFamily: 'JosefinSlab',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    color: kPrimaryTextColor);
const kAppBarText = TextStyle(
    color: kAppBarTextColor,
    fontWeight: FontWeight.w500,
    fontFamily: 'JosefinSlab',
    fontSize: 18.0);

BoxDecoration fieldDecortaion = BoxDecoration(
    borderRadius: BorderRadius.circular(5), color: Colors.grey[200]);

BoxDecoration disabledFieldDecortaion = BoxDecoration(
    borderRadius: BorderRadius.circular(5), color: Colors.grey[100]);

// Field Variables

const double fieldHeight = 55;
const double smallFieldHeight = 40;
const double inputFieldBottomMargin = 30;
const double inputFieldSmallBottomMargin = 0;
const EdgeInsets fieldPadding = const EdgeInsets.symmetric(horizontal: 15);
const EdgeInsets largeFieldPadding =
    const EdgeInsets.symmetric(horizontal: 15, vertical: 15);

// Text Variables
const TextStyle buttonTitleTextStyle =
    const TextStyle(fontWeight: FontWeight.w700, color: Colors.white);

InputDecoration customInputDecoration({String? hintText, Color? hintColor}) =>
    InputDecoration(
      
      hintText: hintText,
      hintStyle: kBodyText4.copyWith(
        color: hintColor ?? Colors.white60,
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: black.withOpacity(.3)),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: kPrimaryColor),
      ),
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: black.withOpacity(.6)),
      ),
    );
