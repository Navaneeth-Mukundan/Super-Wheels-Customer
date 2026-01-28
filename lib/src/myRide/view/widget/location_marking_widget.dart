import 'package:flutter/material.dart';
import 'package:super_wheels_customer_app/src/onboarding/view/splash_screen.dart';
import 'package:super_wheels_customer_app/src/utils/constants/asset_store.dart';
import 'package:super_wheels_customer_app/src/utils/constants/space_helper.dart';
import 'package:super_wheels_customer_app/src/utils/themes/styles/font_style.dart';

class FromToLocationWidget extends StatelessWidget {
  final String pickupAddress;
  final String destinationAddress;
  final String pickupTime;
  final String dropoffTime;
  const FromToLocationWidget({
    super.key,
    required this.pickupAddress,
    required this.destinationAddress,
    required this.dropoffTime,
    required this.pickupTime,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Image.asset(AssetStore().locationMark, height: 30),
            Container(
              width: 1,
              height: 35,
              margin: const EdgeInsets.symmetric(vertical: 4),
              color: Colors.grey.shade400,
            ),

            Image.asset(
              AssetStore().locationMark,
              height: 30,
              color: color.primaryColor,
            ),
          ],
        ),

        kWidth10,

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Pickup
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pickupAddress,
                          maxLines: 5,
                          style: FontStyles().randomTextStylePoppins(
                            size: 15,
                            weight: FontWeight.w600,
                            color: color.kBlackSecondary,
                          ),
                        ),
                        Text(
                          "Pickup point  $pickupTime",
                          style: FontStyles().randomTextStylePoppins(
                            size: 13,
                            weight: FontWeight.w600,
                            color: color.kGrey.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Distance',
                        style: FontStyles().randomTextStylePoppins(
                          size: 13,
                          weight: FontWeight.w500,
                          color: color.kBlackSecondary,
                        ),
                      ),
                      Text(
                        '16km',
                        style: FontStyles().randomTextStylePoppins(
                          size: 15,
                          weight: FontWeight.w600,
                          color: color.kBlackSecondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              kHeight25,

              /// Destination
              Text(
                destinationAddress,
                style: FontStyles().randomTextStylePoppins(
                  size: 15,
                  weight: FontWeight.w600,
                  color: color.kBlackSecondary,
                ),
              ),

              Text(
                "Destination  $dropoffTime",
                style: FontStyles().randomTextStylePoppins(
                  size: 13,
                  weight: FontWeight.w600,
                  color: color.kGrey.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
