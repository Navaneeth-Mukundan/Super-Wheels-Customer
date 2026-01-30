import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_wheels_customer_app/src/booking/controller/booking_controller.dart';
import 'package:super_wheels_customer_app/src/onboarding/view/splash_screen.dart';
import 'package:super_wheels_customer_app/src/utils/constants/asset_store.dart';
import 'package:super_wheels_customer_app/src/utils/constants/screen_route.dart';
import 'package:super_wheels_customer_app/src/utils/constants/space_helper.dart';
import 'package:super_wheels_customer_app/src/utils/themes/styles/font_style.dart';

class SelectLocationWidget extends StatelessWidget {
  const SelectLocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: color.kTransparent,
        backgroundColor: color.kTransparent,
        leading: Container(
          margin: const EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
            color: color.kWhite,
            shape: BoxShape.circle,
            border: Border.all(color: color.kLightGrey.withOpacity(0.5)),
          ),
          child: IconButton(
            icon: Icon(
              Icons.keyboard_arrow_left_rounded,
              size: 30,
              color: color.kBlack,
            ),
            onPressed: () {
              popRoute(context);
            },
          ),
        ),
        title: Text(
          'Where you like to Go?',
          style: FontStyles().randomTextStylePoppins(
            size: 17,
            weight: FontWeight.w500,
            color: color.primaryDarkColor,
          ),
        ),
      ),
      body: SafeArea(
        child: Consumer<BookingController>(
          builder: (context, ctrl, child) {
            return Padding(
              padding: EdgeInsetsGeometry.only(left: 15, right: 15),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    kHeight20,
                    Row(
                      children: [
                        Column(
                          children: [
                            Image.asset(AssetStore().locationMark, height: 30),
                            Container(
                              width: 1,
                              height: 60,
                              margin: const EdgeInsets.symmetric(vertical: 4),
                              color: Colors.grey.shade400,
                            ),
                            Image.asset(
                              AssetStore().locationMark,
                              height: 30,
                              color: color.primaryDarkColor,
                            ),
                          ],
                        ),
                        kWidth10,
                        Expanded(
                          child: Column(
                            children: [
                              locationInputField(
                                'Pickup Location',
                                ctrl.pickupLocatin,
                              ),
                              kHeight15,
                              locationInputField(
                                'Drop Location',
                                ctrl.dropoffLocation,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    kHeight20,
                    ListView.separated(
                      padding: EdgeInsets.only(left: 15),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Text(
                          'Location Number ${index + 1}\n'
                          'st 123, Emirates Road, Dubai, aidnfan aifnaof oanfoif afos fn0 ff asf fonsiofn adfaks fos f,',
                          style: FontStyles().randomTextStylePoppins(
                            size: 15,
                            weight: FontWeight.w400,
                            color: color.kGrey,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return kHeight15;
                      },
                      itemCount: 10,
                    ),
                    kHeight60,
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: Consumer<BookingController>(
        builder: (context, ctrl, child) {
          return GestureDetector(
            onTap: () async {
              final position = await ctrl.getCurrentPosition();
              final location = await ctrl.getAddressFromLatLng(
                position.latitude,
                position.longitude,
              );

              log(location);
              log(
                'This is the Latitude of your Location   ${position.latitude}',
              );

              log(
                'This is the Longitude of your Location   ${position.longitude}',
              );
            },
            child: Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: color.primaryColor,

                border: Border.all(color: color.kLightGrey.withOpacity(0.5)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  'Confirm Location',
                  style: FontStyles().randomTextStylePoppins(
                    size: 18,
                    weight: FontWeight.w600,
                    color: color.kWhite,
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  TextFormField locationInputField(
    String hintText,
    TextEditingController controller,
  ) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        labelText: hintText,
        labelStyle: FontStyles().randomTextStylePoppins(
          size: 16,
          weight: FontWeight.w400,
          color: color.kGrey,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: color.kLightGrey, width: 0.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: color.kLightGrey, width: 0.5),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: color.kLightGrey, width: 0.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: color.kLightGrey, width: 0.5),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 25,
        ),
      ),
    );
  }
}
