import 'package:campus_connect/core/helpers/form_validator_utils.dart';
import 'package:campus_connect/presentation/components/buttons/primary_button.dart';
import 'package:campus_connect/presentation/config/themes/colors.dart';
import 'package:campus_connect/presentation/config/themes/spacing.dart';
import 'package:campus_connect/presentation/config/themes/styles.dart';
import 'package:campus_connect/presentation/screens/Dashboard/account/controllers/account.controller.dart';
import 'package:campus_connect/presentation/screens/Dashboard/home/controllers/home_controller.dart';
import 'package:campus_connect/presentation/screens/Dashboard/widgets/profile_widget.dart';
import 'package:campus_connect/presentation/screens/Dashboard/widgets/tweet_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final HomeController controller = Get.find<HomeController>();
  final AccountController _accountCtrl = Get.find<AccountController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Scaffold(
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
                  builder: (_accountCtrl) => Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ProfileImageWidget(
                        radius: 35,
                        hideImageIcon: true,
                        imageUrl: _accountCtrl.authUser!.profileUrl,
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
                            '@${_accountCtrl.authUser!.username}',
                            style: kBodyText3.copyWith(
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Spacer(),
                      Container(
                        height: 40,
                        width: 130,
                        decoration: BoxDecoration(
                          color: Colors.teal.withOpacity(.3),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          '#Campus Gist',
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
                    children: controller.onTweet
                        ? [
                            vSpaceMedium,
                            if (controller.onAddImage)
                              Container(
                                height: 130,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: black,
                                  borderRadius: BorderRadius.circular(4.0),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                        controller.addedTweetImagePath ??
                                            'assets/images/logo1.png'),
                                  ),
                                ),
                              ),
                            vSpaceTiny,
                            Form(
                              key: controller.formKey,
                              child: TextFormField(
                                keyboardType: TextInputType.multiline,
                                controller: controller.tweetCtrl,
                                style:
                                    kBodyText2.copyWith(fontFamily: 'Overpass'),
                                validator: (value) =>
                                    validateRequired(value!, 'This'),
                                maxLines: 3,
                                decoration: InputDecoration(
                                  hintText: controller.onAddImage
                                      ? 'Captions'
                                      : 'What is on your mind',
                                  hintStyle: kBodyText3,
                                ),
                              ),
                            ),
                            vSpaceSmall,
                            Row(
                              children: [
                                if (!controller.onAddImage)
                                  InkWell(
                                    onTap: () => controller.handleOnAddImage(),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.add_a_photo,
                                          color: white,
                                        ),
                                        hSpaceTiny,
                                        Text(
                                          'Add Image',
                                          style: kBodyText4,
                                        ),
                                      ],
                                    ),
                                  ),
                                hSpaceSmall,
                                Expanded(
                                  child: PrimaryButton(
                                    title: 'Tweet',
                                    bgColor: Colors.teal,
                                    onTap: controller.handleTweet,
                                  ),
                                )
                              ],
                            )
                          ]
                        : [
                            vSpaceMedium,
                            ...controller.tweetList.map(
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
        floatingActionButton: controller.onTweet
            ? null
            : FloatingActionButton(
                onPressed: () {
                  controller.tweetCtrl.clear();
                  controller.onTweet = true;
                },
                child: Icon(Icons.message),
              ),
      ),
    );
  }
}
