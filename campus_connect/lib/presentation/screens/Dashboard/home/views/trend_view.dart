import 'package:cached_network_image/cached_network_image.dart';
import 'package:campus_connect/core/helpers/form_validator_utils.dart';
import 'package:campus_connect/core/utils/format_time.dart';
import 'package:campus_connect/presentation/components/buttons/primary_button.dart';
import 'package:campus_connect/presentation/config/themes/colors.dart';
import 'package:campus_connect/presentation/config/themes/spacing.dart';
import 'package:campus_connect/presentation/config/themes/styles.dart';
import 'package:campus_connect/presentation/screens/Dashboard/account/controllers/account.controller.dart';
import 'package:campus_connect/presentation/screens/Dashboard/home/controllers/home_controller.dart';
import 'package:campus_connect/presentation/screens/Dashboard/widgets/icon_counter_widget.dart';
import 'package:campus_connect/presentation/screens/Dashboard/widgets/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrendView extends StatelessWidget {
  TrendView({Key? key}) : super(key: key);
  HomeController controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => Scaffold(
        backgroundColor: black,
        body: SafeArea(
          child: Container(
            height: screenHeight(context),
            width: screenWidth(context),
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                vSpaceSmall,
                GetBuilder<AccountController>(
                  builder: (accountCtrl) => Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ProfileImageWidget(
                        radius: 35,
                        hideImageIcon: true,
                        imageUrl: accountCtrl.authUser!.profileUrl ??
                            "https://eu.ui-avatars.com/api/?background=random&name=Username",
                      ),
                      hSpaceSmall,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hi!',
                            style: kBodyText4,
                          ),
                          vSpaceTiny,
                          Text(
                            '@${accountCtrl.authUser!.username}',
                            style: kBodyText3.copyWith(
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Spacer(),
                      Container(
                        height: 40,
                        width: 120,
                        decoration: BoxDecoration(
                          color: Colors.teal.withOpacity(.3),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          '#Trending',
                          style: kBodyText2.copyWith(fontFamily: 'Overpass'),
                        ),
                      )
                    ],
                  ),
                ),
                Divider(
                  color: white.withOpacity(.2),
                  thickness: 1,
                ),
                Expanded(
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    children: [
                      vSpaceMedium,
                      ...controller.tweetList
                          .where((tweet) => tweet.retweetCount! > 10)
                          .map(
                            (e) => TweetContainer(
                              onLike: () => controller.likeTweet(e.uid!),
                              onRetweet: () => controller.retweet(e.uid!),
                              timeStamp: e.timeStamp,
                              tweet: e.tweet,
                              likesCount: e.likesCount,
                              retweetCount: e.retweetCount,
                              hasImage: e.hasImage,
                              tweeterUsername: e.tweeterUsername,
                              tweeterProfileUrl: e.tweeterProfileUrl,
                              tweetImageUrl: e.tweetImageUrl,
                            ),
                          ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
