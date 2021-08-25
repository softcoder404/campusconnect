import 'package:campus_connect/core/helpers/form_validator_utils.dart';
import 'package:campus_connect/presentation/components/buttons/arrow_back_widget.dart';
import 'package:campus_connect/presentation/components/buttons/primary_button.dart';
import 'package:campus_connect/presentation/config/themes/colors.dart';
import 'package:campus_connect/presentation/config/themes/spacing.dart';
import 'package:campus_connect/presentation/config/themes/styles.dart';
import 'package:campus_connect/presentation/screens/Dashboard/store/controller/store_controller.dart';
import 'package:campus_connect/presentation/screens/Dashboard/widgets/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostProductView extends StatelessWidget {
  PostProductView({Key? key}) : super(key: key);

  StoreController _controller = Get.find<StoreController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: transparent,
        leading: ArrowBack(),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'Post Product',
              style: kBodyText1,
            ),
          )
        ],
      ),
      body: GetBuilder<StoreController>(
        builder: (_) => SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: SizedBox(
            width: double.infinity,
            child: Form(
              key: _controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  vSpaceMedium,
                  ProfileImageWidget(
                    radius: 80,
                    imageUrl: _controller.selectedProductUrl ??
                        'https://eu.ui-avatars.com/api/?background=random&name=Product',
                    onTap: _controller.handleOnAddImage,
                  ),
                  vSpaceLarge,
                  TextFormField(
                    controller: _controller.nameCtrl,
                    focusNode: _controller.nameNode,
                    style: kBodyText1,
                    validator: (value) =>
                        validateRequired(value!, 'Product Name'),
                    onEditingComplete: () => FocusScope.of(context)
                        .requestFocus(_controller.priceNode),
                    decoration: InputDecoration(
                      hintText: 'Product Name e.g Nike Air Jordan',
                      hintStyle:
                          kBodyText1.copyWith(color: white.withOpacity(.7)),
                    ),
                  ),
                  vSpaceMedium,
                  TextFormField(
                    controller: _controller.priceCtrl,
                    focusNode: _controller.priceNode,
                    keyboardType: TextInputType.phone,
                    style: kBodyText1,
                    validator: (value) =>
                        validateRequired(value!, 'Product Price'),
                    onEditingComplete: () => FocusScope.of(context)
                        .requestFocus(_controller.phoneNode),
                    decoration: InputDecoration(
                      hintText: 'Product Price e.g 25000',
                      hintStyle:
                          kBodyText1.copyWith(color: white.withOpacity(.7)),
                    ),
                  ),
                  vSpaceMedium,
                  TextFormField(
                    style: kBodyText1,
                    keyboardType: TextInputType.phone,
                    controller: _controller.phoneCtrl,
                    focusNode: _controller.phoneNode,
                    validator: (value) =>
                        validateRequired(value!, 'Seller Phone'),
                    onEditingComplete: () => FocusScope.of(context)
                        .requestFocus(_controller.locationNode),
                    decoration: InputDecoration(
                      hintText: 'Seller\'s Phone Number',
                      hintStyle:
                          kBodyText1.copyWith(color: white.withOpacity(.7)),
                    ),
                  ),
                  vSpaceMedium,
                  TextFormField(
                    style: kBodyText1,
                    controller: _controller.locationCtrl,
                    focusNode: _controller.locationNode,
                    validator: (value) =>
                        validateRequired(value!, 'Product Location'),
                    onEditingComplete: () {
                      _controller.locationNode.unfocus();
                      FocusScope.of(context).unfocus();
                    },
                    decoration: InputDecoration(
                      hintText: 'Product Location',
                      hintStyle:
                          kBodyText1.copyWith(color: white.withOpacity(.7)),
                    ),
                  ),
                  vSpaceMedium,
                  vSpaceLarge,
                  PrimaryButton(
                    title: 'Post Product',
                    height: 55,
                    width: double.infinity,
                    onTap: _controller.postProduct,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
