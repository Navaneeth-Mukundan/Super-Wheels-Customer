import 'package:flutter/material.dart';
import 'package:super_wheels_customer_app/src/onboarding/view/splash_screen.dart';
import 'package:super_wheels_customer_app/src/utils/constants/space_helper.dart';
import 'package:super_wheels_customer_app/src/utils/themes/styles/font_style.dart';

class SearchFieldWidget extends StatelessWidget {
  final String content;
  const SearchFieldWidget({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 62,
      width: double.infinity,
      decoration: BoxDecoration(
        color: color.kWhite,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: color.kLightGrey, width: 0.4),
      ),
      child: Row(
        children: [
          kWidth15,
          Icon(Icons.search_rounded, color: color.kBlackSecondary),
          kWidth10,
          Text(
            content,
            style: FontStyles().randomTextStylePoppins(
              size: 15,
              weight: FontWeight.w500,
              color: color.kBlackSecondary,
            ),
          ),
          Spacer(),
          Icon(Icons.location_pin),
          kWidth15,
        ],
      ),
    );
  }
}
