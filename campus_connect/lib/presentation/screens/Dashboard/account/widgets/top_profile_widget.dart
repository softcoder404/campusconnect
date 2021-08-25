import 'package:campus_connect/presentation/config/themes/colors.dart';
import 'package:campus_connect/presentation/config/themes/spacing.dart';
import 'package:campus_connect/presentation/config/themes/styles.dart';
import 'package:campus_connect/presentation/screens/Dashboard/widgets/profile_widget.dart';
import 'package:flutter/material.dart';

class TopProfileCard extends StatelessWidget {
  const TopProfileCard({
    Key? key,
    this.fullName,
    this.university,
    this.username,
    this.profileUrl,
    this.onChangeImage,
  }) : super(key: key);
  final String? fullName;
  final String? username;
  final String? university;
  final String? profileUrl;
  final VoidCallback? onChangeImage;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 25),
      decoration: BoxDecoration(
        color: white.withOpacity(.05),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          ProfileImageWidget(
            radius: 70,
            imageUrl: profileUrl,
            onTap: onChangeImage,
          ),
          vSpaceTiny,
          Text(
            fullName ?? 'AbdulHameed Quadri',
            style: kHeadingText3.copyWith(
              fontStyle: FontStyle.normal,
            ),
          ),
          vSpaceVeryTiny,
          Text(
            username ?? '14/30GC/161',
            style: kBodyText3.copyWith(),
          ),
          vSpaceSmall,
          Text(
            university ?? 'Room 16, Lagos university, Bowen University',
            style: kBodyText4,
          )
        ],
      ),
    );
  }
}
