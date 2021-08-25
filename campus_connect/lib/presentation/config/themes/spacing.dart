import 'package:flutter/material.dart';

const Widget hSpaceVeryTiny = SizedBox(width: 4.0);

const Widget hSpaceTiny = SizedBox(width: 8.0);
const Widget hSpaceSmall = SizedBox(width: 15.0);
const Widget hSpaceMedium = SizedBox(width: 25.0);

const Widget vSpaceVeryTiny = SizedBox(height: 4.0);
const Widget vSpaceTiny = SizedBox(height: 8.0);
const Widget vSpaceSmall = SizedBox(height: 15.0);
const Widget vSpaceMedium = SizedBox(height: 25.0);
const Widget vSpaceLarge = SizedBox(height: 50.0);
const Widget vSpaceMassive = SizedBox(height: 120.0);
const Widget spacer = Expanded(child: SizedBox());
Widget spacedDivider = Column(
  children: const <Widget>[
    vSpaceMedium,
    const Divider(color: Colors.blueGrey, height: 5.0),
    vSpaceMedium,
  ],
);

Widget vSpace(double height) => SizedBox(height: height);
Widget hSpace(double width) => SizedBox(width: width);
double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

double screenHeightFraction(BuildContext context,
        {int dividedBy = 1, double offsetBy = 0}) =>
    (screenHeight(context) - offsetBy) / dividedBy;

double screenWidthFraction(BuildContext context,
        {int dividedBy = 1, double offsetBy = 0}) =>
    (screenWidth(context) - offsetBy) / dividedBy;

double halfScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 2);

double thirdScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 3);
