import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_wheels_customer_app/src/myRide/view/widget/datepicker.dart';
import 'package:super_wheels_customer_app/src/onboarding/view/splash_screen.dart';
import 'package:super_wheels_customer_app/src/profile/controller/profile_controller.dart';
import 'package:super_wheels_customer_app/src/utils/constants/screen_route.dart';
import 'package:super_wheels_customer_app/src/utils/constants/space_helper.dart';
import 'package:super_wheels_customer_app/src/utils/themes/styles/font_style.dart';

class MypaymentsScreen extends StatelessWidget {
  const MypaymentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Provider.of<ProfileController>(
                context,
                listen: false,
              ).clearFields();
              popRoute(context);
            },
          ),
        ),
        title: Text(
          'Payment Activities',
          style: FontStyles().randomTextStylePoppins(
            size: 17,
            letterSpacing: 0.5,
            color: color.kBlackSecondary,
            weight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.only(left: 15, right: 15),
        child: Consumer<ProfileController>(
          builder: (context, payments, child) {
            return Column(
              children: [
                kHeight20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        payments.isCashPayment == true
                            ? null
                            : payments.selectPaymentMode();
                      },
                      child: Text(
                        'Cash Payments',
                        style: FontStyles().randomTextStylePoppins(
                          size: payments.isCashPayment == true ? 17 : 15,
                          weight: FontWeight.w600,
                          color: payments.isCashPayment == true
                              ? color.primaryDarkColor
                              : color.kGrey,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                      width: 2,
                      child: RotatedBox(
                        quarterTurns: 3,
                        child: Divider(color: color.kLightGrey, thickness: 1.5),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        payments.isCashPayment != true
                            ? null
                            : payments.selectPaymentMode();
                      },
                      child: Text(
                        'Card Payments',
                        style: FontStyles().randomTextStylePoppins(
                          size: payments.isCashPayment != true ? 17 : 15,
                          weight: FontWeight.w600,
                          color: payments.isCashPayment != true
                              ? color.primaryDarkColor
                              : color.kGrey,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,

                  margin: const EdgeInsets.only(top: 10, bottom: 16),
                  decoration: BoxDecoration(
                    color: color.kWhite,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: color.kLightGrey),
                  ),
                  child: Column(
                    children: [
                      kHeight10,
                      Row(
                        children: [
                          kWidth10,
                          Expanded(
                            child: RideActivityCalender(
                              label: 'Start Date',
                              selectedDate: payments.paymentStartDate,
                              onDateSelected: (date) {
                                payments.paymentStartDate = date;
                                payments.notifyListeners();
                              },
                            ),
                          ),
                          kWidth10,
                          Expanded(
                            child: RideActivityCalender(
                              label: 'End Date',
                              selectedDate: payments.paymentEndDate,
                              onDateSelected: (date) {
                                payments.paymentEndDate = date;
                                payments.notifyListeners();
                              },
                            ),
                          ),
                          kWidth10,
                        ],
                      ),
                      kHeight10,
                    ],
                  ),
                ),

                Center(
                  child: Text(
                    'No payment activities available',
                    style: FontStyles().randomTextStylePoppins(
                      size: 16,
                      weight: FontWeight.w500,
                      color: color.kGrey,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
