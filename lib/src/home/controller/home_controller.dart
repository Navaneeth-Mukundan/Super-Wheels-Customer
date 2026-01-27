import 'package:flutter/material.dart';
import 'package:super_wheels_customer_app/src/utils/constants/asset_store.dart';

class HomeController extends ChangeNotifier {
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

  final List<String> flashSaleImages = [
    'https://pngimg.com/uploads/iphone16/iphone16_PNG13.png',
    'https://pngimg.com/uploads/iphone16/iphone16_PNG13.png',
    'https://pngimg.com/uploads/iphone16/iphone16_PNG13.png',
    'https://pngimg.com/uploads/iphone16/iphone16_PNG13.png',
    'https://pngimg.com/uploads/iphone16/iphone16_PNG13.png',
    'https://pngimg.com/uploads/iphone16/iphone16_PNG13.png',
    'https://pngimg.com/uploads/iphone16/iphone16_PNG13.png',
    'https://pngimg.com/uploads/iphone16/iphone16_PNG13.png',
  ];
}
