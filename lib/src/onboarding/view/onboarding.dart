import 'package:flutter/material.dart';
import 'package:super_wheels_customer_app/src/auth/view/login.dart';
import 'package:super_wheels_customer_app/src/onboarding/widget/onboard_widget.dart';
import 'package:super_wheels_customer_app/src/utils/constants/asset_store.dart';
import 'package:super_wheels_customer_app/src/utils/constants/screen_route.dart';

class OnboardingScreenOne extends StatelessWidget {
  const OnboardingScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetStore().bgImg),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: OnboardingWidget(
            title: 'Find\nYour Destination',
            subtitle:
                'Set your pickup and drop location in seconds and get ready to ride.',
            currentIndex: 1,
            onNext: () {
              pushReplacementRoute(context, const OnboardingScreenTwo());
            },
          ),
        ),
      ),
    );
  }
}

class OnboardingScreenThree extends StatelessWidget {
  const OnboardingScreenThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetStore().bgImg),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: OnboardingWidget(
            title: 'Ride With Confidence',
            subtitle:
                'Enjoy safe, comfortable rides trusted by thousands of happy users.',
            currentIndex: 3,
            onNext: () {
              pushReplacementRoute(context, const LoginScreen());
            },
          ),
        ),
      ),
    );
  }
}

class OnboardingScreenTwo extends StatelessWidget {
  const OnboardingScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetStore().bgImg),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: OnboardingWidget(
            title: 'Your Ride Is On\nthe Way',
            subtitle:
                'Nearby drivers arrive fast so you’re never kept waiting.',
            currentIndex: 2,
            onNext: () {
              pushReplacementRoute(context, const OnboardingScreenThree());
            },
          ),
        ),
      ),
    );
  }
}
