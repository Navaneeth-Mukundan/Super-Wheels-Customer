import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:super_wheels_customer_app/src/myRide/controller/myride_controller.dart';
import 'package:super_wheels_customer_app/src/onboarding/view/splash_screen.dart';
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
          body: Column(
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
                        color: color.primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.keyboard_arrow_left_rounded,
                          size: 30,
                          color: color.kWhite,
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
                      'Taxi Ride Details',
                      style: FontStyles().randomTextStylePoppins(
                        size: 19,
                        color: color.kBlackSecondary,
                        weight: FontWeight.w600,
                      ),
                    ),
                    kHeight15,
                    Container(
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: color.kWhite,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: color.kLightGrey),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
