import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:super_wheels_customer_app/src/onboarding/view/splash_screen.dart';

class MyrideController extends ChangeNotifier {
  String? selectedStatus;
  String? selectedRideType;
  DateTime? scheduleStartDate;
  DateTime? scheduleEndDate;
  DateTime? previousStartDate;
  DateTime? previousEndDate;
  bool isSceduledRide = true;
  String mapTheme = "";

  var currentLat = 25.1972;

  var currentLng = 55.2797;

  Completer<GoogleMapController> controller = Completer<GoogleMapController>();
  late final CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(currentLat, currentLng),
    zoom: 13,
  );

  final Set<Marker> marker = {};

  final Set<Polyline> polylines = {};

  final List<String> statusList = [
    'All Ride',
    'Pending',
    'Accept',
    'Start',
    'Cancelled',
    'Stop',
    'Completed',
    'Reject',
  ];

  final List<String> rideTypeList = [
    'All Ride',
    'Schedule Ride',
    'Hourly Ride',
    'Daily Ride',
    'Instant Ride',
    'City Ride',
    'Airport Ride',
  ];

  var destinationLat = 25.2489;

  var destinationlng = 55.3061;

  bool mapAlive = false;
  void clearFilters() {
    selectedStatus = null;
    selectedRideType = null;
    scheduleStartDate = null;
    scheduleEndDate = null;
    previousStartDate = null;
    previousEndDate = null;
    notifyListeners();
  }

  Future<void> drawRoutePolyline() async {
    PolylinePoints polylinePoints = PolylinePoints();

    final result = await polylinePoints.getRouteBetweenCoordinates(
      googleApiKey: "AIzaSyB10wS0wPBYk8uK2qzG4Th87psRpfRB650",
      request: PolylineRequest(
        origin: PointLatLng(currentLat, currentLng),
        destination: PointLatLng(destinationLat, destinationlng),
        mode: TravelMode.driving,
      ),
    );

    if (result.points.isEmpty) return;

    final List<LatLng> routePoints = result.points
        .map((point) => LatLng(point.latitude, point.longitude))
        .toList();

    polylines.clear();
    polylines.add(
      Polyline(
        polylineId: const PolylineId('route'),
        width: 5,
        color: color.primaryColor,
        points: routePoints,
      ),
    );
  }

  Future<void> fitRouteToMap({
    required double currentLat,
    required double currentLng,
    required double destinationLat,
    required double destinationLng,
    double padding = 100,
  }) async {
    final minLat = min(currentLat, destinationLat);
    final maxLat = max(currentLat, destinationLat);
    final minLng = min(currentLng, destinationLng);
    final maxLng = max(currentLng, destinationLng);

    final bounds = LatLngBounds(
      southwest: LatLng(minLat, minLng),
      northeast: LatLng(maxLat, maxLng),
    );

    final GoogleMapController mapController = await controller.future;

    await mapController.animateCamera(
      CameraUpdate.newLatLngBounds(bounds, padding),
    );
    //await drawRoutePolyline();
    setPickupDropMarkers();
    notifyListeners();
  }

  void selectRideMode() {
    isSceduledRide = !isSceduledRide;
    clearFilters();
    notifyListeners();
  }

  void setPickupDropMarkers() {
    marker.clear();

    // Pickup marker
    marker.add(
      Marker(
        markerId: const MarkerId('pickup'),
        position: LatLng(currentLat, currentLng),
        infoWindow: const InfoWindow(title: 'Pickup'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueCyan, // green for start
        ),
      ),
    );

    // Drop marker
    marker.add(
      Marker(
        markerId: const MarkerId('drop'),
        position: LatLng(destinationLat, destinationlng),
        infoWindow: const InfoWindow(title: 'Drop'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueRed, // red for end
        ),
      ),
    );
  }
}
