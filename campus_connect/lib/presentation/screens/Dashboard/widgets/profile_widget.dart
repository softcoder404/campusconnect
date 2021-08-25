import 'package:cached_network_image/cached_network_image.dart';
import 'package:campus_connect/presentation/config/themes/colors.dart';
import 'package:flutter/material.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({
    Key? key,
    this.imageUrl,
    this.onTap,
    required this.radius,
    this.hideImageIcon = false,
  }) : super(key: key);
  final String? imageUrl;
  final VoidCallback? onTap;
  final double radius;
  final bool? hideImageIcon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: radius,
        width: radius,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.amber, width: 1),
          color: Colors.amber.withOpacity(.3),
          borderRadius: BorderRadius.circular(radius / 2),
          image: DecorationImage(
            image: CachedNetworkImageProvider(imageUrl ??
                'https://eu.ui-avatars.com/api/?background=random&name=Username'),
            fit: BoxFit.cover,
          ),
        ),
        child: hideImageIcon!
            ? null
            : Align(
                alignment: Alignment.bottomRight,
                child: CircleAvatar(
                  backgroundColor: Colors.amber,
                  radius: 12,
                  child: Icon(
                    Icons.add_a_photo,
                    color: white,
                    size: 12,
                  ),
                ),
              ),
      ),
    );
  }
}
