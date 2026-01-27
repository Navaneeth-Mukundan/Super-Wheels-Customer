import 'package:flutter/material.dart';
import 'package:super_wheels_customer_app/src/onboarding/view/splash_screen.dart';
import 'package:super_wheels_customer_app/src/profile/widget/settings_input_field.dart';
import 'package:super_wheels_customer_app/src/utils/constants/asset_store.dart';
import 'package:super_wheels_customer_app/src/utils/constants/screen_route.dart';
import 'package:super_wheels_customer_app/src/utils/constants/space_helper.dart';
import 'package:super_wheels_customer_app/src/utils/themes/styles/font_style.dart';

class ManageProfileScreen extends StatelessWidget {
  const ManageProfileScreen({super.key});

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
            'Manage Profile',
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                kHeight60,

                Center(
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      color: color.primaryColor,
                      shape: BoxShape.circle,
                      border: Border.all(color: color.kWhite, width: 2),
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
                ),
                kHeight15,
                SettingsInputField(
                  hintText: 'Name',
                  keyboardType: TextInputType.name,
                ),
                kHeight15,
                SettingsInputField(
                  hintText: 'Phone Number',
                  prefixText: "🇦🇪 +971 ",
                  keyboardType: TextInputType.number,
                ),
                kHeight15,
                SettingsInputField(
                  hintText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                ),
                kHeight20,
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: color.primaryColor,
                      border: Border.all(color: color.kWhite, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Save Changes',
                        style: FontStyles().randomTextStyle(
                          size: 18,
                          weight: FontWeight.w700,
                          color: color.kWhite,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
