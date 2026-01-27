import 'package:flutter/material.dart';
import 'package:super_wheels_customer_app/src/onboarding/view/splash_screen.dart';
import 'package:super_wheels_customer_app/src/profile/view/manage_profile.dart';
import 'package:super_wheels_customer_app/src/profile/view/mypayments.dart';
import 'package:super_wheels_customer_app/src/profile/view/settings.dart';
import 'package:super_wheels_customer_app/src/utils/constants/asset_store.dart';
import 'package:super_wheels_customer_app/src/utils/constants/screen_route.dart';
import 'package:super_wheels_customer_app/src/utils/constants/space_helper.dart';
import 'package:super_wheels_customer_app/src/utils/themes/styles/font_style.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kHeight30,
                Row(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: color.secondaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          'N',
                          style: FontStyles().randomTextStyle(
                            size: 50,
                            weight: FontWeight.w500,
                            color: color.kWhite,
                          ),
                        ),
                      ),
                    ),
                    kWidth15,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Email',
                            style: FontStyles().randomTextStylePoppins(
                              size: 20,
                              weight: FontWeight.bold,
                              color: color.kBlack,
                            ),
                          ),
                          Text(
                            'Abcde@gmail.com ',
                            maxLines: 3,
                            overflow: TextOverflow.fade,
                            style: FontStyles().randomTextStylePoppins(
                              size: 20,
                              weight: FontWeight.w500,
                              color: color.kGrey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                kHeight10,
                Text(
                  'Navaneeth',
                  style: FontStyles().randomTextStylePoppins(
                    size: 30,
                    weight: FontWeight.bold,
                    color: color.kBlack,
                  ),
                ),

                kHeight30,
                Text(
                  'Profile',
                  style: FontStyles().randomTextStylePoppins(
                    size: 20,
                    weight: FontWeight.w600,
                    color: color.kBlack,
                  ),
                ),
                kHeight15,
                GestureDetector(
                  onTap: () {
                    pushRoute(context, ManageProfileScreen());
                  },
                  child: profileTile(
                    const Color.fromARGB(255, 148, 148, 148),
                    'Manage Profile',
                    AssetStore().manageProfile,
                    12,
                  ),
                ),
                kHeight25,
                Text(
                  'Settings',
                  style: FontStyles().randomTextStylePoppins(
                    size: 20,
                    weight: FontWeight.w600,
                    color: color.kBlack,
                  ),
                ),
                kHeight15,
                GestureDetector(
                  onTap: () {
                    pushRoute(context, const MypaymentsScreen());
                  },
                  child: profileTile(
                    const Color.fromARGB(255, 148, 148, 148),
                    'My Payments',
                    AssetStore().myPayments,
                    10,
                  ),
                ),
                kHeight20,
                GestureDetector(
                  onTap: () {
                    pushRoute(context, SettingScreen());
                  },
                  child: profileTile(
                    const Color.fromARGB(255, 148, 148, 148),
                    'Settings',
                    AssetStore().settings,
                    14,
                  ),
                ),
                kHeight20,
                profileTile(
                  const Color.fromARGB(255, 148, 148, 148),
                  'Log Out',
                  AssetStore().logOut,
                  14,
                ),
                kHeight60,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row profileTile(Color colors, String title, String image, double padding) {
    return Row(
      children: [
        Container(
          height: 55,
          width: 55,
          decoration: BoxDecoration(shape: BoxShape.circle, color: colors),
          child: Padding(
            padding: EdgeInsets.all(padding),
            child: Image.asset(image, color: color.kWhite),
          ),
        ),
        kWidth15,
        Text(
          title,
          style: FontStyles().randomTextStylePoppins(
            size: 16,
            weight: FontWeight.w600,
            color: color.kBlackSecondary,
          ),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.only(
            left: 13,
            right: 11,
            top: 9,
            bottom: 9,
          ),
          decoration: BoxDecoration(
            color: color.kLightGrey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.asset(AssetStore().rightArrow, height: 25),
        ),
      ],
    );
  }
}
