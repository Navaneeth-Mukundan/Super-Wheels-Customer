import 'package:flutter/material.dart';
import 'package:super_wheels_customer_app/src/onboarding/view/splash_screen.dart';
import 'package:super_wheels_customer_app/src/utils/constants/asset_store.dart';
import 'package:super_wheels_customer_app/src/utils/constants/screen_route.dart';
import 'package:super_wheels_customer_app/src/utils/constants/space_helper.dart';
import 'package:super_wheels_customer_app/src/utils/themes/styles/font_style.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetStore().bgImg2),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: color.kTransparent,
        appBar: AppBar(
          backgroundColor: color.kTransparent,
          surfaceTintColor: color.primaryColor,
          automaticallyImplyLeading: false,
          toolbarHeight: 80,
          leading: Container(
            margin: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: color.primaryColor,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: Icon(
                Icons.keyboard_arrow_left_rounded,
                size: 30,
                color: color.kWhite,
              ),
              onPressed: () {
                popRoute(context);
              },
            ),
          ),
          title: Text(
            'About Us',
            style: FontStyles().randomTextStylePoppins(
              size: 18,
              letterSpacing: 0.5,
              color: color.kBlackSecondary,
              weight: FontWeight.w600,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsetsGeometry.only(left: 15, right: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kHeight20,
                Center(child: Image.asset(AssetStore().logo, height: 80)),
                Center(child: Image.asset(AssetStore().logoText, height: 80)),
                kHeight25,
                Text(
                  textAlign: TextAlign.left,
                  'About Super Wheels',
                  style: FontStyles().randomTextStylePoppins(
                    size: 20,
                    letterSpacing: 0.5,
                    color: color.primaryDarkColor,
                    weight: FontWeight.w600,
                  ),
                ),
                kHeight5,
                Text(
                  textAlign: TextAlign.left,
                  "Super Wheels is a premier provider of luxury transportation services based in Dubai, UAE. "
                  "Our fleet of high-end vehicles, including Lexus hybrids and electric models, "
                  "ensures a blend of comfort, sustainability, and reliability for every journey.",
                  style: FontStyles().randomTextStylePoppins(
                    size: 15,
                    color: color.kBlackSecondary,
                    weight: FontWeight.w600,
                  ),
                ),
                kHeight20,
                Align(
                  alignment: AlignmentGeometry.topRight,
                  child: Text(
                    textAlign: TextAlign.right,
                    'Our Mission',
                    style: FontStyles().randomTextStylePoppins(
                      size: 20,
                      letterSpacing: 0.5,
                      color: color.primaryDarkColor,
                      weight: FontWeight.w600,
                    ),
                  ),
                ),
                kHeight5,
                Text(
                  "To redefine luxury transportation by delivering exceptional services that blend "
                  "sophistication, sustainability, and personalized experiences.",
                  textAlign: TextAlign.right,
                  style: FontStyles().randomTextStylePoppins(
                    size: 15,
                    color: color.kBlackSecondary,
                    weight: FontWeight.w600,
                  ),
                ),
                kHeight20,
                Text(
                  textAlign: TextAlign.left,
                  'Our Vision',
                  style: FontStyles().randomTextStylePoppins(
                    size: 20,
                    letterSpacing: 0.5,
                    color: color.primaryDarkColor,
                    weight: FontWeight.w600,
                  ),
                ),
                kHeight5,
                Text(
                  "To be the most trusted brand in premium transportation, setting benchmarks in "
                  "innovation, sustainability, and customer satisfaction.",
                  textAlign: TextAlign.left,
                  style: FontStyles().randomTextStylePoppins(
                    size: 15,
                    color: color.kBlackSecondary,
                    weight: FontWeight.w600,
                  ),
                ),
                kHeight60,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
