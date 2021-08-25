
import 'package:cached_network_image/cached_network_image.dart';
import 'package:campus_connect/core/utils/format_time.dart';
import 'package:campus_connect/presentation/config/themes/colors.dart';
import 'package:campus_connect/presentation/config/themes/spacing.dart';
import 'package:campus_connect/presentation/config/themes/styles.dart';
import 'package:campus_connect/presentation/screens/Dashboard/widgets/icon_counter_widget.dart';
import 'package:campus_connect/presentation/screens/Dashboard/widgets/profile_widget.dart';
import 'package:flutter/material.dart';

class TweetContainer extends StatelessWidget {
  const TweetContainer({
    Key? key,
    this.hasImage,
    this.onLike,
    this.onRetweet,
    this.likesCount,
    this.retweetCount,
    this.timeStamp,
    this.tweet,
    this.tweetImageUrl,
    this.tweeterProfileUrl,
    this.tweeterUsername,
  }) : super(key: key);
  final String? tweet;
  final bool? hasImage;
  final String? tweeterUsername;
  final String? tweeterProfileUrl;
  final String? tweetImageUrl;
  final int? likesCount;
  final int? retweetCount;
  final String? timeStamp;
  final VoidCallback? onLike;
  final VoidCallback? onRetweet;
  @override
  Widget build(BuildContext context) {
    print(tweetImageUrl);
    print(tweeterProfileUrl);
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileImageWidget(
            radius: 30,
            hideImageIcon: true,
            imageUrl: tweeterProfileUrl,
          ),
          hSpaceTiny,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '@$tweeterUsername',
                  style: kBodyText4.copyWith(fontWeight: FontWeight.w500),
                ),
                vSpaceTiny,
                Text(
                  tweet ?? 'Wahala for who no get bae!. #weather4two',
                  style: kBodyText2.copyWith(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Overpass',
                  ),
                ),
                vSpaceTiny,
                if (hasImage!)
                  Container(
                    height: 130,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: black,
                      borderRadius: BorderRadius.circular(4.0),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: CachedNetworkImageProvider(tweetImageUrl ??
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwYD-Q1AqXYhnvBK3X3WHvtKjx3IaUReHjPg&usqp=CAU'),
                      ),
                    ),
                  ),
                vSpaceTiny,
                Text(
                  timePeriod(timeStamp!),
                  style: kBodyText4.copyWith(
                    fontFamily: 'Overpass',
                  ),
                ),
                vSpaceSmall,
                SizedBox(
                  height: 20,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconCounterWidget(
                        icon: Icons.favorite_outline,
                        count: likesCount.toString(),
                        color: Colors.red,
                        onTap: onLike,
                      ),
                      hSpaceMedium,
                      IconCounterWidget(
                        icon: Icons.replay,
                        color: kSuccessColor,
                        count: retweetCount.toString(),
                        onTap: onRetweet,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}