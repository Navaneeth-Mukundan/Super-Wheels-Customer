import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:super_wheels_customer_app/src/booking/controller/booking_controller.dart';
import 'package:super_wheels_customer_app/src/booking/view/schedule_ride/screens/select_location.dart';
import 'package:super_wheels_customer_app/src/onboarding/view/splash_screen.dart';
import 'package:super_wheels_customer_app/src/utils/constants/screen_route.dart';
import 'package:super_wheels_customer_app/src/utils/constants/space_helper.dart';
import 'package:super_wheels_customer_app/src/utils/themes/styles/font_style.dart';

class ScheduleRideScreen extends StatelessWidget {
  const ScheduleRideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<BookingController>(
        builder: (context, ride, child) {
          return Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 500,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                    child: GoogleMap(
                      myLocationEnabled: true,
                      myLocationButtonEnabled: true,
                      mapType: MapType.normal,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(0, 0),
                        zoom: 20,
                      ),
                      onMapCreated: (GoogleMapController mapController) async {
                        if (ride.controller.isCompleted == false) {
                          ride.controller.complete(mapController);
                        } else {
                          null;
                        }

                        await ride.moveToCurrentLocation();
                      },
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
              kHeight10,
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    kHeight10,

                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: color.primaryColor.withOpacity(0.5),
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Schedule Your Ride',
                            style: FontStyles().randomTextStylePoppins(
                              size: 20,
                              color: color.kBlackSecondary,
                              weight: FontWeight.w600,
                            ),
                          ),
                          kHeight15,
                          GestureDetector(
                            onTap: () {
                              pickDate(context, (date) {
                                ride.dateScheduled = DateFormat(
                                  'dd MMM yyyy',
                                ).format(date);
                                ride.notifyListeners();
                              });
                            },
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: color.kLightGrey.withOpacity(0.5),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.date_range_outlined,
                                      color: color.primaryColor,
                                    ),
                                    kWidth10,
                                    Text(
                                      ride.dateScheduled != ''
                                          ? ride.dateScheduled
                                          : 'Please Select Date',

                                      style: FontStyles()
                                          .randomTextStylePoppins(
                                            size: 15,
                                            weight: FontWeight.w500,
                                            color: color.kGrey,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          kHeight15,
                          GestureDetector(
                            onTap: () {
                              showIOSTimePicker(
                                context,
                                initialTime: TimeOfDay.now(),
                                onTimeSelected: (time) {
                                  ride.timeScheduled = formatTimeWithAmPm(time);

                                  ride.notifyListeners();
                                },
                              );
                            },
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: color.kLightGrey.withOpacity(0.5),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.access_time_rounded,
                                      color: color.primaryColor,
                                    ),
                                    kWidth10,
                                    Text(
                                      ride.timeScheduled != ''
                                          ? ride.timeScheduled
                                          : 'Please Select Time',

                                      style: FontStyles()
                                          .randomTextStylePoppins(
                                            size: 15,
                                            weight: FontWeight.w500,
                                            color: color.kGrey,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          kHeight15,
                          GestureDetector(
                            onTap: () {
                              pushRoute(context, SelectLocationWidget());
                            },
                            child: Container(
                              height: 60,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: color.primaryColor,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: color.kLightGrey.withOpacity(0.5),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'Continue',
                                  style: FontStyles().randomTextStylePoppins(
                                    size: 16,
                                    weight: FontWeight.w600,
                                    color: color.kWhite,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  String formatTimeWithAmPm(TimeOfDay time) {
    final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.period == DayPeriod.am ? 'AM' : 'PM';

    return '$hour:$minute $period';
  }

  Future<DateTime?> pickDate(
    BuildContext context,
    ValueChanged<DateTime> onDateSelected,
  ) async {
    final DateTime today = DateTime.now();

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: today,
      firstDate: DateTime(today.year, today.month, today.day),
      lastDate: DateTime(today.year + 2),
    );

    if (picked != null) {
      onDateSelected(picked);
    }
    return null;
  }

  Future<void> showIOSTimePicker(
    BuildContext context, {
    required TimeOfDay initialTime,
    required Function(TimeOfDay) onTimeSelected,
  }) async {
    DateTime selectedDate = DateTime(
      0,
      0,
      0,
      initialTime.hour,
      initialTime.minute,
    );

    await showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return Container(
          height: 300,
          color: CupertinoColors.systemBackground.resolveFrom(context),
          child: Column(
            children: [
              // Top bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    child: const Text("Cancel"),
                    onPressed: () => Navigator.pop(context),
                  ),
                  CupertinoButton(
                    child: const Text("Done"),
                    onPressed: () {
                      onTimeSelected(
                        TimeOfDay(
                          hour: selectedDate.hour,
                          minute: selectedDate.minute,
                        ),
                      );
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),

              const Divider(height: 0),

              Expanded(
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.time,
                  use24hFormat: false,
                  initialDateTime: selectedDate,
                  onDateTimeChanged: (DateTime newDate) {
                    selectedDate = newDate;
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
