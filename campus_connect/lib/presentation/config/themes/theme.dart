import 'package:flutter/material.dart';
import 'colors.dart';

ThemeData theme(context) {
  return ThemeData(
    primaryColor: kPrimaryColor,
    fontFamily: 'JosefinSlab',
    visualDensity: VisualDensity.adaptivePlatformDensity,
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      buttonColor: kPrimaryColor,
      textTheme: ButtonTextTheme.primary,
    ),
    accentColor: Color(0x0FF009688),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey.withOpacity(.07),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: BorderSide.none,
      ),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      hintStyle: TextStyle(fontStyle: FontStyle.normal),
    ),
    appBarTheme: AppBarTheme.of(context).copyWith(
      color: Colors.white,
      textTheme: TextTheme(
        headline6: TextStyle(color: Colors.black, fontSize: 20),
      ),
      iconTheme: IconThemeData(color: Colors.black),
      actionsIconTheme: IconThemeData(color: Colors.black),
      brightness: Brightness.light,
      centerTitle: true,
      elevation: 0,
    ),
  );
}
