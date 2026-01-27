import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:super_wheels_customer_app/src/myRide/controller/myride_controller.dart';
import 'package:super_wheels_customer_app/src/utils/constants/screen_route.dart';

class RideDetailsScreen extends StatelessWidget {
  const RideDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MyrideController>(
      builder: (context, ride, child) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                popRoute(context);
              },
              icon: Icon(Icons.arrow_back_ios),
            ),
          ),
          body: Column(
            children: [
              Container(
                height: 300,
                decoration: BoxDecoration(),
                child: GoogleMap(
                  myLocationButtonEnabled: false,
                  initialCameraPosition: ride.kGooglePlex,
                  zoomControlsEnabled: false,
                  indoorViewEnabled: false,
                  trafficEnabled: false,
                  mapType: MapType.normal,
                  polylines: ride.polylines,
                  markers: Set<Marker>.of(ride.marker),
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
            ],
          ),
        );
      },
    );
  }
}
