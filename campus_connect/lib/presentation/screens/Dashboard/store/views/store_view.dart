import 'package:cached_network_image/cached_network_image.dart';
import 'package:campus_connect/core/helpers/form_validator_utils.dart';
import 'package:campus_connect/core/utils/format_time.dart';
import 'package:campus_connect/presentation/config/themes/colors.dart';
import 'package:campus_connect/presentation/config/themes/spacing.dart';
import 'package:campus_connect/presentation/config/themes/styles.dart';
import 'package:campus_connect/presentation/screens/Dashboard/store/controller/store_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreView extends StatelessWidget {
  StoreView({Key? key}) : super(key: key);

  StoreController storeController = Get.find<StoreController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: SafeArea(
          child: Container(
        height: screenHeight(context),
        width: screenWidth(context),
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StoreLogoWidget(),
            vSpaceMedium,
            Expanded(
              child: GetBuilder<StoreController>(
                builder: (_) => ListView(
                  physics: BouncingScrollPhysics(),
                  children: storeController.storeProducts
                      .map((store) => StoreGoodCard(
                            name: store.name,
                            imageUrl: store.imageUrl,
                            location: store.location,
                            phone: store.phone,
                            price: store.price,
                            timestamp: store.timestamp,
                            onCall: () =>
                                storeController.callSeller(store.phone!),
                          ))
                      .toList(),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}

class StoreGoodCard extends StatelessWidget {
  const StoreGoodCard({
    Key? key,
    this.imageUrl,
    this.location,
    this.name,
    this.phone,
    this.price,
    this.timestamp,
    this.onCall,
  }) : super(key: key);
  final String? name;
  final String? price;
  final String? imageUrl;
  final String? timestamp;
  final String? location;
  final String? phone;
  final VoidCallback? onCall;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      width: double.infinity,
      height: 120,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            width: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: white,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: CachedNetworkImageProvider(
                  imageUrl ??
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrHxczOciVOIdFp2dddoZhnxE9Ora2_W2KwZvI0mDjQy7WSuWpTf9XtzQyYPqPCX8kfx-ih-vq&usqp=CAc',
                ),
              ),
            ),
          ),
          hSpaceSmall,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name ?? 'Nike Air Jordan',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: kBodyText1,
                ),
                vSpaceTiny,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on,
                      color: white.withOpacity(.7),
                      size: 14,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: Text(
                        location ?? 'University of ilorin',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style:
                            kBodyText4.copyWith(color: white.withOpacity(.7)),
                      ),
                    )
                  ],
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'N' + formatMoney(price ?? '25000', precision: 0),
                          style: kBodyText1,
                        ),
                        vSpaceTiny,
                        Text(
                          timePeriod(timestamp ?? DateTime.now().toString()),
                          style: kBodyText4,
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: onCall,
                      icon: Icon(
                        Icons.call,
                        color: kSuccessColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StoreLogoWidget extends StatelessWidget {
  const StoreLogoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: 60,
        width: screenWidth(context) * .8,
        decoration: BoxDecoration(
          color: kPrimaryColor.withOpacity(.4),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Campus Stores',
                  style: kBodyText1.copyWith(
                    fontFamily: 'Overpass',
                  ),
                ),
                hSpaceSmall,
                Icon(
                  Icons.store,
                  color: white,
                  size: 20,
                )
              ],
            ),
            Text(
              'Buy or sell your goods on campus store',
              style: kBodyText4.copyWith(
                fontFamily: 'Overpass',
                color: white.withOpacity(.7),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
