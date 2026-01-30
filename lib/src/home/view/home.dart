import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:super_wheels_customer_app/src/booking/controller/booking_controller.dart';
import 'package:super_wheels_customer_app/src/home/controller/home_controller.dart';
import 'package:super_wheels_customer_app/src/home/widget/screen_gradient_widget.dart';
import 'package:super_wheels_customer_app/src/home/widget/search_field_widget.dart';
import 'package:super_wheels_customer_app/src/onboarding/view/splash_screen.dart';
import 'package:super_wheels_customer_app/src/utils/constants/asset_store.dart';
import 'package:super_wheels_customer_app/src/utils/constants/screen_route.dart';
import 'package:super_wheels_customer_app/src/utils/constants/space_helper.dart';
import 'package:super_wheels_customer_app/src/utils/themes/styles/font_style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenGradientWidget(
      child: Scaffold(
        backgroundColor: color.kTransparent,
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(22),
              bottomRight: Radius.circular(22),
            ),
          ),
          toolbarHeight: 80,
          backgroundColor: color.kTransparent,
          title: Column(
            children: [
              Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                      color: color.kWhite,
                      boxShadow: [
                        BoxShadow(
                          color: color.kBlack.withOpacity(0.2),
                          blurRadius: 2,
                          offset: const Offset(0, 0),
                        ),
                      ],
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      'N',
                      style: FontStyles().randomTextStylePoppins(
                        size: 24,
                        weight: FontWeight.w600,
                        color: color.primaryDarkColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  kWidth10,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello , Navaneeth',
                        style: FontStyles().randomTextStylePoppins(
                          size: 18,
                          weight: FontWeight.w500,
                          color: color.kBlack.withOpacity(0.7),
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Welcome to ',
                          style: FontStyles().randomTextStylePoppins(
                            size: 14,
                            weight: FontWeight.w500,
                            color: color.kGrey,
                          ),
                          children: [
                            TextSpan(
                              text: 'Super Wheels',
                              style: FontStyles().randomTextStylePoppins(
                                size: 14,
                                weight: FontWeight.w500,
                                color: color.primaryDarkColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Stack(
                    children: [
                      Container(
                        width: 55,
                        height: 55,
                        decoration: BoxDecoration(
                          color: color.kWhite,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: color.kLightGrey,
                            width: 0.5,
                          ),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.notifications_none_rounded,
                            color: color.kGrey,
                            size: 30,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 38,
                        child: Icon(
                          Icons.circle,
                          color: color.primaryColor,
                          size: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        body: Consumer2<HomeController, BookingController>(
          builder: (context, controller, booking, _) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      kHeight25,
                      const SearchFieldWidget(content: 'Enter Destination'),
                      kHeight20,
                      Container(
                        width: double.infinity,
                        height: 168,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: color.kBlack.withOpacity(0.2),
                              blurRadius: 2,
                              offset: const Offset(0, 0),
                            ),
                          ],
                          color: color.kLightGrey.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(22),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              'https://i0.wp.com/techpatio.com/wp-content/uploads/2022/08/taxi-booking-app.jpg?fit=824%2C350&ssl=1&w=640',
                            ),
                          ),
                        ),
                      ),
                      kHeight30,

                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: List.generate(5, (index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: GestureDetector(
                                onTap: () {
                                  pushRoute(context, controller.screens[index]);
                                  booking.controller =
                                      Completer<GoogleMapController>();
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      width: 85,
                                      height: 85,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: color.kBlack.withOpacity(
                                              0.18,
                                            ),
                                            blurRadius: 1,
                                            offset: const Offset(0, 0),
                                          ),
                                        ],
                                        shape: BoxShape.circle,
                                        gradient: const RadialGradient(
                                          radius: 0.6,
                                          colors: [
                                            Color.fromARGB(255, 255, 239, 186),
                                            Color.fromARGB(255, 255, 255, 255),
                                          ],
                                        ),
                                      ),
                                      child: Padding(
                                        padding: index == 2
                                            ? EdgeInsets.all(14.0)
                                            : EdgeInsets.all(10.0),
                                        child: Image.asset(
                                          controller.ridesIconsList[index],
                                          color: color.kBlackSecondary
                                              .withOpacity(0.9),
                                        ),
                                      ),
                                    ),
                                    kHeight5,
                                    Text(
                                      controller.typeOfRidesList[index],
                                      textAlign: TextAlign.center,
                                      style: FontStyles()
                                          .randomTextStylePoppins(
                                            size: 13,
                                            weight: FontWeight.w600,
                                            color: color.kBlackSecondary,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                      kHeight30,
                      Text(
                        "Where to go ?",
                        style: FontStyles().randomTextStylePoppins(
                          size: 20,
                          weight: FontWeight.w700,
                          color: color.kBlack,
                        ),
                      ),
                      kHeight15,
                      Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 240,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: color.kLightGrey,
                                width: 0.4,
                              ),
                              color: color.kLightGrey.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(22),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(AssetStore().map),
                              ),
                            ),
                          ),

                          Center(
                            child: Container(
                              margin: EdgeInsets.only(
                                top: 15,
                                left: 20,
                                right: 20,
                              ),
                              height: 130,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: color.kLightGrey,
                                    blurRadius: 3,
                                    offset: const Offset(0, 0),
                                  ),
                                ],

                                color: color.kWhite.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                children: [
                                  kHeight10,
                                  Container(
                                    height: 58,
                                    width: double.infinity,

                                    margin: const EdgeInsets.only(
                                      left: 10,
                                      right: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: color.kLightGrey,
                                        width: 0.4,
                                      ),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        kWidth15,
                                        Container(
                                          margin: const EdgeInsets.only(top: 9),
                                          height: 35,
                                          width: 35,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              5,
                                            ),
                                            color: color.primaryDarkColor,
                                          ),
                                          child: Icon(
                                            Icons.search,
                                            color: color.kWhite,
                                          ),
                                        ),
                                        kWidth10,
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 17,
                                          ),
                                          child: Text(
                                            "Where's Location ?",
                                            style: FontStyles()
                                                .randomTextStylePoppins(
                                                  letterSpacing: 0.8,
                                                  size: 16,
                                                  weight: FontWeight.w600,
                                                  color: color.kBlackSecondary,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  kHeight5,
                                  Row(
                                    children: [
                                      kWidth25,
                                      Container(
                                        margin: const EdgeInsets.only(top: 9),
                                        height: 35,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            5,
                                          ),
                                          color: color.kLightGrey,
                                        ),
                                        child: Icon(
                                          Icons.business_outlined,
                                          color: color.kWhite,
                                        ),
                                      ),
                                      kWidth10,
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            top: 5,
                                          ),
                                          child: Text(
                                            'Al Yalayis Center  ',
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 4,
                                            style: FontStyles()
                                                .randomTextStylePoppins(
                                                  size: 14,
                                                  weight: FontWeight.w500,
                                                  color: color.kBlackSecondary,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      kHeight25,
                      Container(
                        width: double.infinity,
                        height: 168,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: color.kBlack.withOpacity(0.2),
                              blurRadius: 2,
                              offset: const Offset(0, 0),
                            ),
                          ],
                          color: color.kLightGrey.withOpacity(0.5),

                          borderRadius: BorderRadius.circular(22),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              'https://www.spaceotechnologies.com/wp-content/uploads/2024/01/Taxi-App-Development-Services.jpg',
                            ),
                          ),
                        ),
                      ),
                      kHeight60,
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
