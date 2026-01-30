import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:super_wheels_customer_app/src/onboarding/view/splash_screen.dart';

class BookingController extends ChangeNotifier {
  Completer<GoogleMapController> controller = Completer<GoogleMapController>();
  TextEditingController pickupLocatin = TextEditingController(
    text: 'Current Location',
  );
  TextEditingController dropoffLocation = TextEditingController();

  late final CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(currentLat, currentLng),
    zoom: 13,
  );
  String mapTheme = "";

  var destinationLat;

  var destinationlng;

  var currentLat;

  var currentLng;

  final Set<Marker> marker = {};

  final Set<Polyline> polylines = {};

  String dateScheduled = '';
  TimeOfDay scheduleTime = TimeOfDay.now();
  String timeScheduled = '';

  String pickupAddress = '';

  LatLng? pickupLatLng;

  String dropoffAddress = '';

  LatLng? dropoffLatLng;

  // Function helps to draw route between pickup & dropoff location in map.
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

  // function helps to mark pickup & dropoff location in map.
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

  // Function helps to get the details of location including name of street, locality ect.. .
  Future<String> getAddressFromLatLng(double lat, double lng) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);

    if (placemarks.isEmpty) return "Current Location";

    final place = placemarks.first;

    return [
      place.street,
      place.locality,
      place.administrativeArea,
      place.country,
    ].where((e) => e != null && e.isNotEmpty).join(', ');
  }

  // Function helps to get the current position of user.
  Future<Position> getCurrentPosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception("Location services are disabled");
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception("Location permission permanently denied");
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  // Function helps to show the current location automatically when map opens.
  Future<void> moveToCurrentLocation() async {
    final GoogleMapController mapController = await controller.future;

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    mapController.animateCamera(
      CameraUpdate.newLatLngZoom(
        LatLng(position.latitude, position.longitude),
        17,
      ),
    );
  }

  // Function helps to make the default pickup as current location.
  Future<void> setCurrentLocationAsPickup() async {
    final position = await getCurrentPosition();

    final address = await getAddressFromLatLng(
      position.latitude,
      position.longitude,
    );

    setPickup(
      address: address,
      latLng: LatLng(position.latitude, position.longitude),
    );
  }

  void setDropoff({required String address, required LatLng latLng}) {
    dropoffAddress = address;
    dropoffLatLng = latLng;
    notifyListeners();
  }

  void setPickup({required String address, required LatLng latLng}) {
    pickupAddress = address;
    pickupLatLng = latLng;
    notifyListeners();
  }

  // Function helps to mark the pickup point and drop off point in map.
  void setPickupDropMarkers() {
    marker.clear();
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
