import 'package:campus_connect/presentation/config/themes/colors.dart';
import 'package:campus_connect/presentation/config/themes/spacing.dart';
import 'package:campus_connect/presentation/config/themes/styles.dart';
import 'package:flutter/material.dart';

class AccountMenuCard extends StatelessWidget {
  const AccountMenuCard({
    Key? key,
    required this.iconData,
    this.title,
    this.onTap,
  }) : super(key: key);
  final String? title;
  final IconData iconData;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 55,
        margin: EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: white.withOpacity(.05),
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: white.withOpacity(.1),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Icon(
                iconData,
                size: 20,
                color: white,
              ),
            ),
            hSpaceSmall,
            Text(
              title ?? 'My Favorites',
              style: kBodyText2.copyWith(color: white),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              color: white.withOpacity(.6),
              size: 20,
            )
          ],
        ),
      ),
    );
  }
}
