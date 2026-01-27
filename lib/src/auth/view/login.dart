import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_wheels_customer_app/src/auth/controller/auth_controller.dart';
import 'package:super_wheels_customer_app/src/auth/widget/input_field.dart';
import 'package:super_wheels_customer_app/src/auth/widget/otp_ui.dart';
import 'package:super_wheels_customer_app/src/onboarding/view/splash_screen.dart';
import 'package:super_wheels_customer_app/src/utils/constants/asset_store.dart';
import 'package:super_wheels_customer_app/src/utils/constants/space_helper.dart';
import 'package:super_wheels_customer_app/src/utils/themes/styles/font_style.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
        resizeToAvoidBottomInset: true,
        extendBody: true,
        backgroundColor: Colors.transparent,
        body: Consumer<AuthController>(
          builder: (context, auth, child) {
            return Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Image.asset(AssetStore().logo, height: 90),
                          Image.asset(AssetStore().logoText, height: 90),
                        ],
                      ),
                      kHeight60,
                      auth.verifyOtp == true
                          ? OtpVerificationScreen()
                          : Container(
                              decoration: BoxDecoration(
                                color: color.kWhite,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  kHeight30,
                                  Text(
                                    'Welcome back',
                                    style: FontStyles().randomTextStylePoppins(
                                      size: 34,
                                      color: color.kBlack,
                                      weight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Enter your phone number below',
                                    style: FontStyles().randomTextStylePoppins(
                                      size: 16,
                                      color: color.kGrey,
                                      weight: FontWeight.w400,
                                    ),
                                  ),
                                  kHeight20,
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      left: 20,
                                      right: 20,
                                    ),
                                    child: InputFieldWidget(
                                      hintText: 'Phone Number',
                                    ),
                                  ),

                                  kHeight20,
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 35,
                                      right: 35,
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        // pushReplacementRoute(
                                        //   context,
                                        //   BottomNavigation(),
                                        // );
                                        auth.verifyOtp = true;
                                        auth.notifyListeners();
                                      },
                                      child: Container(
                                        height: 65,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: color.kBlack,
                                          borderRadius: BorderRadius.circular(
                                            18,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Sign In',
                                            style: FontStyles()
                                                .randomTextStylePoppins(
                                                  size: 20,
                                                  weight: FontWeight.w600,
                                                  color: color.kWhite,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  kHeight25,
                                ],
                              ),
                            ),
                      kHeight15,
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
