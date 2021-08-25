import 'package:campus_connect/presentation/components/buttons/arrow_back_widget.dart';
import 'package:campus_connect/presentation/config/themes/colors.dart';
import 'package:campus_connect/presentation/config/themes/spacing.dart';
import 'package:campus_connect/presentation/config/themes/styles.dart';
import 'package:campus_connect/presentation/screens/Dashboard/account/controllers/account.controller.dart';
import 'package:campus_connect/presentation/screens/Dashboard/home/controllers/home_controller.dart';
import 'package:campus_connect/presentation/screens/Dashboard/widgets/tweet_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTweetView extends StatelessWidget {
  MyTweetView({Key? key}) : super(key: key);
  HomeController controller = Get.find<HomeController>();
  AccountController _accountCtrl = Get.find<AccountController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: black,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: ArrowBack(),
          backgroundColor: black,
          title: Text(
            'My Tweets',
            style: kBodyText2,
          ),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              vSpaceMedium,
              ...controller.tweetList
                  .where((tweet) =>
                      tweet.tweeterUsername == _accountCtrl.authUser!.username)
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
        ));
  }
}
