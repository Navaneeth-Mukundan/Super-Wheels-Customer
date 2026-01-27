import 'package:flutter/material.dart';
import 'package:super_wheels_customer_app/src/onboarding/view/splash_screen.dart';
import 'package:super_wheels_customer_app/src/utils/constants/asset_store.dart';
import 'package:super_wheels_customer_app/src/utils/constants/space_helper.dart';
import 'package:super_wheels_customer_app/src/utils/themes/styles/font_style.dart';

class OnboardingWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final int currentIndex;
  final GestureTapCallback onNext;
  const OnboardingWidget({
    required this.title,
    required this.subtitle,
    required this.currentIndex,
    required this.onNext,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Image.asset(AssetStore().logo, height: 200),
              Image.asset(AssetStore().logoText, height: 100),
            ],
          ),

          Column(
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: FontStyles().randomTextStylePoppins(
                  letterSpacing: 1,
                  weight: FontWeight.bold,
                  size: 30,
                  color: color.kBlack,
                ),
              ),
              kHeight15,
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: FontStyles().randomTextStylePoppins(
                  weight: FontWeight.w400,
                  size: 15,
                  color: color.kGrey,
                ),
              ),
              kHeight20,
              GestureDetector(
                onTap: onNext,
                child: Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  height: 65,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: color.primaryColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                      currentIndex == 3 ? 'Finish' : 'Next',
                      style: FontStyles().randomTextStylePoppins(
                        weight: FontWeight.w600,
                        size: 20,
                        color: color.kWhite,
                      ),
                    ),
                  ),
                ),
              ),
              kHeight20,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  kWidth20,
                  Icon(
                    Icons.circle,
                    size: 20,
                    color: currentIndex == 1 ? color.kWhite : color.kBlack,
                  ),
                  kWidth10,
                  Icon(
                    Icons.circle,
                    size: 20,
                    color: currentIndex == 2 ? color.kWhite : color.kBlack,
                  ),
                  kWidth10,
                  Icon(
                    Icons.circle,
                    size: 20,
                    color: currentIndex == 3 ? color.kWhite : color.kBlack,
                  ),
                  kWidth10,
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
