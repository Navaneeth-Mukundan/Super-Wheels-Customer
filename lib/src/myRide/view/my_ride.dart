import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:super_wheels_customer_app/src/myRide/controller/myride_controller.dart';
import 'package:super_wheels_customer_app/src/myRide/view/ride_details.dart';
import 'package:super_wheels_customer_app/src/myRide/view/widget/datepicker.dart';
import 'package:super_wheels_customer_app/src/myRide/view/widget/dropdown_widget.dart';
import 'package:super_wheels_customer_app/src/onboarding/view/splash_screen.dart';
import 'package:super_wheels_customer_app/src/utils/constants/asset_store.dart';
import 'package:super_wheels_customer_app/src/utils/constants/screen_route.dart';
import 'package:super_wheels_customer_app/src/utils/constants/space_helper.dart';
import 'package:super_wheels_customer_app/src/utils/themes/styles/font_style.dart';

class MyRideScreen extends StatelessWidget {
  const MyRideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ride Activity',
          style: FontStyles().randomTextStylePoppins(
            size: 20,
            weight: FontWeight.w600,
            color: color.primaryDarkColor,
          ),
        ),
        centerTitle: true,
        surfaceTintColor: color.kTransparent,
        backgroundColor: color.kTransparent,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Consumer<MyrideController>(
              builder: (context, myride, _) {
                return Column(
                  children: [
                    kHeight15,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            myride.isSceduledRide == true
                                ? null
                                : myride.selectRideMode();
                          },
                          child: Text(
                            'Schedule Rides',
                            style: FontStyles().randomTextStylePoppins(
                              size: myride.isSceduledRide == true ? 17 : 15,
                              weight: FontWeight.w600,
                              color: myride.isSceduledRide == true
                                  ? color.primaryDarkColor
                                  : color.kGrey,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                          width: 2,
                          child: RotatedBox(
                            quarterTurns: 3,
                            child: Divider(
                              color: color.kLightGrey,
                              thickness: 1.5,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            myride.isSceduledRide != true
                                ? null
                                : myride.selectRideMode();
                          },
                          child: Text(
                            'Previous Rides',
                            style: FontStyles().randomTextStylePoppins(
                              size: myride.isSceduledRide != true ? 17 : 15,
                              weight: FontWeight.w600,
                              color: myride.isSceduledRide != true
                                  ? color.primaryDarkColor
                                  : color.kGrey,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: double.infinity,

                      margin: const EdgeInsets.only(top: 10, bottom: 16),
                      decoration: BoxDecoration(
                        color: color.kWhite,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: color.kLightGrey),
                      ),
                      child: Column(
                        children: [
                          kHeight10,
                          myride.isSceduledRide != true
                              ? Kshrink
                              : Row(
                                  children: [
                                    kWidth10,
                                    Expanded(
                                      child: RideActivityDropdown(
                                        hint: 'Status',
                                        value: myride.selectedStatus,
                                        items: myride.statusList,
                                        onChanged: (value) {
                                          myride.selectedStatus = value;
                                          myride.notifyListeners();
                                        },
                                      ),
                                    ),
                                    kWidth10,
                                    Expanded(
                                      child: RideActivityDropdown(
                                        hint: 'Ride Type',
                                        value: myride.selectedRideType,
                                        items: myride.rideTypeList,
                                        onChanged: (value) {
                                          myride.selectedRideType = value;
                                          myride.notifyListeners();
                                        },
                                      ),
                                    ),
                                    kWidth10,
                                  ],
                                ),
                          myride.isSceduledRide != true ? Kshrink : kHeight10,
                          Row(
                            children: [
                              kWidth10,
                              Expanded(
                                child: RideActivityCalender(
                                  label: 'Start Date',
                                  selectedDate: myride.isSceduledRide == true
                                      ? myride.scheduleStartDate
                                      : myride.previousStartDate,
                                  onDateSelected: (date) {
                                    myride.isSceduledRide == true
                                        ? myride.scheduleStartDate = date
                                        : myride.previousStartDate = date;
                                    myride.notifyListeners();
                                  },
                                ),
                              ),
                              kWidth10,
                              Expanded(
                                child: RideActivityCalender(
                                  label: 'End Date',
                                  selectedDate: myride.isSceduledRide == true
                                      ? myride.scheduleEndDate
                                      : myride.previousEndDate,
                                  onDateSelected: (date) {
                                    myride.isSceduledRide == true
                                        ? myride.scheduleEndDate = date
                                        : myride.previousEndDate = date;
                                    myride.notifyListeners();
                                  },
                                ),
                              ),
                              kWidth10,
                            ],
                          ),
                          kHeight10,
                        ],
                      ),
                    ),

                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            pushRoute(context, RideDetailsScreen());
                            myride.controller =
                                Completer<GoogleMapController>();
                          },
                          child: Container(
                            width: double.infinity,
                            height: 100,
                            decoration: BoxDecoration(
                              color: color.kWhite,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: color.kLightGrey.withOpacity(0.5),
                              ),
                            ),
                            child: Row(
                              children: [
                                kWidth15,
                                Image.asset(AssetStore().carIcon, height: 80),
                                kWidth10,
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Ride to Financial Center Metro Station, DIFC',
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: FontStyles()
                                            .randomTextStylePoppins(
                                              size: 15,
                                              weight: FontWeight.w600,
                                              color: color.kGrey,
                                            ),
                                      ),
                                      kHeight5,
                                      Row(
                                        children: [
                                          Text(
                                            'AED 140',
                                            style: FontStyles()
                                                .randomTextStylePoppins(
                                                  size: 15,
                                                  weight: FontWeight.w600,
                                                  color: color.kBlack,
                                                ),
                                          ),
                                          Spacer(),
                                          Text(
                                            'Completed',
                                            style: FontStyles()
                                                .randomTextStylePoppins(
                                                  size: 15,
                                                  weight: FontWeight.w600,
                                                  color: color.primaryColor,
                                                ),
                                          ),
                                          kWidth10,
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => kHeight15,
                      itemCount: 10,
                    ),
                    kHeight60,
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
