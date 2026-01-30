import 'package:flutter/material.dart';
import 'package:super_wheels_customer_app/src/booking/view/hourly_ride/hourly_ride.dart';
import 'package:super_wheels_customer_app/src/booking/view/schedule_ride/schedule_ride.dart';
import 'package:super_wheels_customer_app/src/utils/constants/asset_store.dart';

class HomeController extends ChangeNotifier {
  final List<Widget> screens = [ScheduleRideScreen(), HourlyRideScreen()];

  final List<String> typeOfRidesList = [
    'Schedule\na Ride',
    'Hourly\nRides',
    'Daily\nRides',
    'City\nRides',
    'Airport\nRides',
  ];

  final List<String> ridesIconsList = [
    AssetStore().scheduleRide,
    AssetStore().hourlyRide,
    AssetStore().dailyRide,
    AssetStore().cityRide,
    AssetStore().airportRide,
  ];
}
