import 'package:campus_connect/presentation/config/themes/spacing.dart';
import 'package:campus_connect/presentation/config/themes/styles.dart';
import 'package:flutter/material.dart';

class IconCounterWidget extends StatelessWidget {
  const IconCounterWidget({
    Key? key,
    this.count,
    this.onTap,
    this.color,
    this.icon,
  }) : super(key: key);
  final IconData? icon;
  final String? count;
  final Color? color;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Icon(
            icon ?? Icons.favorite_outline,
            color: color ?? Colors.red,
            size: 18,
          ),
          hSpaceTiny,
          Text(
            count ?? '3',
            style: kBodyText4.copyWith(
              fontFamily: 'Overpass',
            ),
          )
        ],
      ),
    );
  }
}
