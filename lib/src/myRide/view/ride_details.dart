import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:super_wheels_customer_app/src/myRide/controller/myride_controller.dart';
import 'package:super_wheels_customer_app/src/myRide/view/widget/location_marking_widget.dart';
import 'package:super_wheels_customer_app/src/onboarding/view/splash_screen.dart';
import 'package:super_wheels_customer_app/src/utils/constants/asset_store.dart';
import 'package:super_wheels_customer_app/src/utils/constants/screen_route.dart';
import 'package:super_wheels_customer_app/src/utils/constants/space_helper.dart';
import 'package:super_wheels_customer_app/src/utils/themes/styles/font_style.dart';

class RideDetailsScreen extends StatelessWidget {
  const RideDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MyrideController>(
      builder: (context, ride, child) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                      ),
                      child: IgnorePointer(
                        ignoring: true,
                        child: GoogleMap(
                          myLocationButtonEnabled: false,
                          initialCameraPosition: ride.kGooglePlex,
                          zoomControlsEnabled: false,
                          zoomGesturesEnabled: false,
                          buildingsEnabled: false,
                          indoorViewEnabled: false,
                          trafficEnabled: false,
                          mapType: MapType.normal,
                          polylines: ride.polylines,
                          markers: ride.marker,
                          onMapCreated: (GoogleMapController controller) async {
                            controller.setMapStyle(ride.mapTheme);

                            if (ride.controller.isCompleted == false) {
                              ride.controller.complete(controller);
                            } else {
                              null;
                            }

                            ride.fitRouteToMap(
                              currentLat: ride.currentLat,
                              currentLng: ride.currentLng,
                              destinationLat: ride.destinationLat,
                              destinationLng: ride.destinationlng,
                            );
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      top: 60,
                      left: 10,
                      child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          color: color.kWhite,
                          shape: BoxShape.circle,
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
                    ),
                  ],
                ),

                kHeight15,
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ride to Financial Center Metro Station, DIFC',
                        maxLines: 5,
                        style: FontStyles().randomTextStylePoppins(
                          size: 25,
                          color: color.kBlack,
                          weight: FontWeight.w600,
                        ),
                      ),

                      Text(
                        'Drop-off on Saturday, 22 Jan 2026 11:34 PM',
                        style: FontStyles().randomTextStylePoppins(
                          size: 15,
                          color: color.kGrey,
                          weight: FontWeight.w400,
                        ),
                      ),
                      kHeight25,
                      Text(
                        'Taxi Ride Details',
                        style: FontStyles().randomTextStylePoppins(
                          size: 19,
                          color: color.kBlackSecondary,
                          weight: FontWeight.w600,
                        ),
                      ),
                      kHeight10,
                      Container(
                        padding: EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 15,
                          bottom: 15,
                        ),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: color.kWhite,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: color.kLightGrey.withOpacity(0.5),
                          ),
                        ),
                        child: FromToLocationWidget(
                          pickupTime: '11:05 PM',
                          dropoffTime: '11:34 PM',
                          pickupAddress: "Ground Level - Burjman",
                          destinationAddress:
                              "Financial Center Metro Station, DIFC",
                        ),
                      ),
                      kHeight15,

                      Container(
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: color.kWhite,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: color.kLightGrey.withOpacity(0.5),
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 55,
                              width: 55,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: color.primaryColor,
                                shape: BoxShape.circle,
                                border: Border.all(color: color.kLightGrey),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                    'https://sandbox.superwheels.me/uploads/drivers/images/1751093317_image_2025-06-28_104819426.png',
                                  ),
                                ),
                              ),
                            ),
                            kWidth15,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'ABHISHEKH PAL',
                                    style: FontStyles().randomTextStylePoppins(
                                      size: 15,
                                      color: color.kBlackSecondary,
                                      weight: FontWeight.w600,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Toyota Avanza, Black',
                                        maxLines: 3,
                                        style: FontStyles()
                                            .randomTextStylePoppins(
                                              size: 14,
                                              color: color.kBlackSecondary,
                                              weight: FontWeight.w500,
                                            ),
                                      ),
                                      Spacer(),
                                      Text(
                                        'A 1234 Y',
                                        style: FontStyles()
                                            .randomTextStylePoppins(
                                              size: 14,
                                              color: color.kGrey,
                                              weight: FontWeight.w400,
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      kHeight15,
                      Text(
                        'Pay With',
                        style: FontStyles().randomTextStylePoppins(
                          size: 19,
                          color: color.kBlackSecondary,
                          weight: FontWeight.w600,
                        ),
                      ),
                      kHeight15,
                      Row(
                        children: [
                          Image.asset(
                            AssetStore().money,
                            height: 45,
                            color: color.kGrey,
                          ),
                          kWidth20,
                          Text(
                            'Cash Payment',
                            style: FontStyles().randomTextStylePoppins(
                              size: 15,
                              color: color.kBlackSecondary,
                              weight: FontWeight.w500,
                            ),
                          ),
                          Spacer(),
                          Text(
                            'AED 28.50',
                            style: FontStyles().randomTextStylePoppins(
                              size: 16,
                              color: color.kBlack,
                              weight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      kHeight15,
                      Text(
                        'Payment Details',
                        style: FontStyles().randomTextStylePoppins(
                          size: 19,
                          color: color.kBlackSecondary,
                          weight: FontWeight.w600,
                        ),
                      ),
                      kHeight10,
                      Container(
                        padding: EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 15,
                          bottom: 15,
                        ),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: color.kWhite,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: color.kLightGrey.withOpacity(0.5),
                          ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Ride fare',
                                  style: FontStyles().randomTextStylePoppins(
                                    size: 15,
                                    color: color.kBlackSecondary,
                                    weight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  'AED 27.50',
                                  style: FontStyles().randomTextStylePoppins(
                                    size: 15,
                                    color: color.kBlackSecondary,
                                    weight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            Divider(color: color.kLightGrey.withOpacity(0.2)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Distance Charge',
                                  style: FontStyles().randomTextStylePoppins(
                                    size: 15,
                                    color: color.kBlackSecondary,
                                    weight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  'AED 12.00',
                                  style: FontStyles().randomTextStylePoppins(
                                    size: 15,
                                    color: color.kBlackSecondary,
                                    weight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            Divider(color: color.kLightGrey.withOpacity(0.2)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Pickup Charge',
                                  style: FontStyles().randomTextStylePoppins(
                                    size: 15,
                                    color: color.kBlackSecondary,
                                    weight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  'AED 12.00',
                                  style: FontStyles().randomTextStylePoppins(
                                    size: 15,
                                    color: color.kBlackSecondary,
                                    weight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            Divider(color: color.kLightGrey.withOpacity(0.2)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Waiting Time Fee',
                                  style: FontStyles().randomTextStylePoppins(
                                    size: 15,
                                    color: color.kBlackSecondary,
                                    weight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  'AED 3.50',
                                  style: FontStyles().randomTextStylePoppins(
                                    size: 15,
                                    color: color.kBlackSecondary,
                                    weight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            kHeight10,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total',
                                  style: FontStyles().randomTextStylePoppins(
                                    size: 17,
                                    color: color.kBlack,
                                    weight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  'AED 28.50',
                                  style: FontStyles().randomTextStylePoppins(
                                    size: 19,
                                    color: color.kBlack,
                                    weight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                kHeight60,
              ],
            ),
          ),
        );
      },
    );
  }
}
