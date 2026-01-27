import 'package:flutter/material.dart';
import 'package:super_wheels_customer_app/src/onboarding/view/onboarding.dart';
import 'package:super_wheels_customer_app/src/utils/constants/asset_store.dart';
import 'package:super_wheels_customer_app/src/utils/constants/screen_route.dart';
import 'package:super_wheels_customer_app/src/utils/constants/space_helper.dart';
import 'package:super_wheels_customer_app/src/utils/themes/colors/colors.dart';

ColorManager color = ColorManager();

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      navigateToBoarding(context);
    });
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 46, 46, 46),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset(AssetStore().logo, height: 90)),
          kHeight10,
          Center(child: Image.asset(AssetStore().companyName, height: 50)),
        ],
      ),
    );
  }

  Future<void> navigateToBoarding(context) async {
    Future.delayed(const Duration(seconds: 2), () {
      pushRemoveUntilRoute(context, const OnboardingScreenOne());
      // pushRemoveUntilRoute(context, BottomNavigation());
    });
  }
}
