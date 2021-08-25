import 'package:campus_connect/presentation/components/buttons/primary_button.dart';
import 'package:campus_connect/presentation/config/themes/colors.dart';
import 'package:campus_connect/presentation/config/themes/spacing.dart';
import 'package:campus_connect/presentation/config/themes/styles.dart';
import 'package:campus_connect/presentation/screens/Dashboard/account/controllers/account.controller.dart';
import 'package:campus_connect/presentation/screens/Dashboard/account/views/edit_profile_view.dart';
import 'package:campus_connect/presentation/screens/Dashboard/account/views/my_tweet_view.dart';
import 'package:campus_connect/presentation/screens/Dashboard/account/views/post_product_view.dart';
import 'package:campus_connect/presentation/screens/Dashboard/account/widgets/account_menu_card_widget.dart';
import 'package:campus_connect/presentation/screens/Dashboard/account/widgets/top_profile_widget.dart';
import 'package:campus_connect/presentation/screens/Dashboard/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountView extends StatelessWidget {
  AccountView({Key? key}) : super(key: key);
  final AccountController controller =
      Get.put<AccountController>(AccountController());

  final HomeController _homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountController>(
      builder: (_) => Scaffold(
        backgroundColor: kPrimaryBorder.withOpacity(.08),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(15.0),
            width: double.infinity,
            height: screenHeight(context),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        TopProfileCard(
                          fullName: controller.authUser!.fullName,
                          username: '@${controller.authUser!.username}',
                          university: controller.authUser!.university,
                          profileUrl: controller.authUser!.profileUrl,
                          onChangeImage: () =>
                              controller.handleChangeProfileImage(),
                        ),
                        vSpaceSmall,
                        AccountMenuCard(
                          title: 'Edit Profile',
                          iconData: Icons.person,
                          onTap: () => Get.to(
                            () => EditAccountView(),
                            transition: Transition.upToDown,
                          ),
                        ),
                        AccountMenuCard(
                          title:
                              'My Tweets (${_homeController.tweetList.where((tweet) => tweet.tweeterUsername == controller.authUser!.username).toList().length})',
                          iconData: Icons.password,
                          onTap: () => Get.to(
                            () => MyTweetView(),
                            transition: Transition.upToDown,
                          ),
                        ),
                        AccountMenuCard(
                          title: 'Sell A Product',
                          iconData: Icons.store,
                          onTap: () => Get.to(
                            () => PostProductView(),
                            transition: Transition.upToDown,
                          ),
                        ),
                        AccountMenuCard(
                          title: 'Contact Us',
                          iconData: Icons.call,
                          onTap: controller.onTalkToUs,
                        ),
                      ],
                    ),
                  ),
                ),
                vSpaceTiny,
                InkWell(
                  onTap: controller.logout,
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Log Out',
                      style: kButtonTextStyle.copyWith(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
