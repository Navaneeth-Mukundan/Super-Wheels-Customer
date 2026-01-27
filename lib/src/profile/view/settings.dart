import 'package:flutter/material.dart';
import 'package:super_wheels_customer_app/src/home/widget/screen_gradient_widget.dart';
import 'package:super_wheels_customer_app/src/onboarding/view/splash_screen.dart';
import 'package:super_wheels_customer_app/src/profile/view/settings/about_us.dart';
import 'package:super_wheels_customer_app/src/profile/view/settings/delete_account.dart';
import 'package:super_wheels_customer_app/src/profile/view/settings/notifications.dart';
import 'package:super_wheels_customer_app/src/profile/view/settings/support.dart';
import 'package:super_wheels_customer_app/src/utils/constants/asset_store.dart';
import 'package:super_wheels_customer_app/src/utils/constants/screen_route.dart';
import 'package:super_wheels_customer_app/src/utils/constants/space_helper.dart';
import 'package:super_wheels_customer_app/src/utils/themes/styles/font_style.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenGradientWidget(
      child: Scaffold(
        backgroundColor: color.kTransparent,
        appBar: AppBar(
          backgroundColor: color.kTransparent,
          surfaceTintColor: color.primaryColor,
          automaticallyImplyLeading: false,
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
            'Settings',
            style: FontStyles().randomTextStylePoppins(
              size: 17,
              letterSpacing: 1,
              color: color.kBlackSecondary,
              weight: FontWeight.w600,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsetsGeometry.only(left: 15, right: 15),
          child: Column(
            children: [
              kHeight30,
              profileTile(
                const Color.fromARGB(255, 168, 168, 168),
                'Notifications',
                AssetStore().notificationIcon,
                14,
                () {
                  pushRoute(context, NotificationsScreen());
                },
              ),
              kHeight20,
              profileTile(
                const Color.fromARGB(255, 168, 168, 168),
                'About Us',
                AssetStore().aboutUsIcon,
                14,
                () {
                  pushRoute(context, AboutUsScreen());
                },
              ),
              kHeight20,
              profileTile(
                const Color.fromARGB(255, 168, 168, 168),
                'Support',
                AssetStore().supportIcon,
                14,
                () {
                  pushRoute(context, SupportScreen());
                },
              ),
              kHeight20,
              profileTile(
                const Color.fromARGB(255, 168, 168, 168),
                'Delete Account',
                AssetStore().dlAccountIcon,
                10,
                () {
                  pushRoute(context, DeleteAccountScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  profileTile(
    Color colors,
    String title,
    String image,
    double padding,
    GestureTapCallback action,
  ) {
    return GestureDetector(
      onTap: action,
      child: Row(
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
      ),
    );
  }
}
