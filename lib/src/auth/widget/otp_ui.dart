import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:super_wheels_customer_app/src/auth/controller/auth_controller.dart';
import 'package:super_wheels_customer_app/src/onboarding/view/splash_screen.dart';
import 'package:super_wheels_customer_app/src/utils/constants/screen_route.dart';
import 'package:super_wheels_customer_app/src/utils/constants/space_helper.dart';
import 'package:super_wheels_customer_app/src/utils/themes/styles/font_style.dart';
import 'package:super_wheels_customer_app/src/utils/widgets/bottom_navigation.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthController>(
      builder: (context, auth, _) {
        return Container(
          decoration: BoxDecoration(
            color: color.kWhite,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              kHeight30,
              Text(
                'Verify Your Account',
                style: FontStyles().randomTextStylePoppins(
                  size: 28,
                  color: color.kBlackSecondary,
                  weight: FontWeight.bold,
                ),
              ),
              Text(
                'We have sent you an OTP on +971 55 555 5555',
                style: FontStyles().randomTextStylePoppins(
                  size: 13,
                  color: color.kGrey,
                  weight: FontWeight.w400,
                ),
              ),
              kHeight20,
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: PinCodeTextField(
                  appContext: context,
                  length: 6,
                  autoDismissKeyboard: false,
                  cursorColor: color.kBlack,
                  keyboardType: TextInputType.number,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    activeColor: color.kLightGrey,
                    selectedColor: color.kLightGrey,
                    inactiveColor: color.kLightGrey,
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(10),
                    fieldHeight: 50,
                    fieldWidth: 45,
                  ),
                  onChanged: (value) {},
                  onCompleted: (value) {
                    FocusScope.of(context).unfocus();
                    print("OTP entered: $value");
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        auth.verifyOtp = false;
                        auth.notifyListeners();
                      },
                      child: Text(
                        'Change Number',
                        style: FontStyles().randomTextStylePoppins(
                          size: 14,
                          color: color.kGrey,
                          weight: FontWeight.w500,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Resend OTP',
                        style: FontStyles().randomTextStylePoppins(
                          size: 14,
                          color: color.kGrey,
                          weight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              kHeight20,
              Padding(
                padding: const EdgeInsets.only(left: 35, right: 35),
                child: GestureDetector(
                  onTap: () {
                    pushReplacementRoute(context, BottomNavigation());
                  },
                  child: Container(
                    height: 65,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: color.kBlack,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Center(
                      child: Text(
                        'Verify',
                        style: FontStyles().randomTextStylePoppins(
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
        );
      },
    );
  }
}
