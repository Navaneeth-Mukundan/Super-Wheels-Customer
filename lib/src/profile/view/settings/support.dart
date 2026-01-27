import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_wheels_customer_app/src/home/widget/screen_gradient_widget.dart';
import 'package:super_wheels_customer_app/src/onboarding/view/splash_screen.dart';
import 'package:super_wheels_customer_app/src/profile/controller/profile_controller.dart';
import 'package:super_wheels_customer_app/src/utils/constants/screen_route.dart';
import 'package:super_wheels_customer_app/src/utils/constants/space_helper.dart';
import 'package:super_wheels_customer_app/src/utils/themes/styles/font_style.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

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
            'Our Support',
            style: FontStyles().randomTextStylePoppins(
              size: 17,
              letterSpacing: 0.5,
              color: color.kBlackSecondary,
              weight: FontWeight.w600,
            ),
          ),
        ),
        body: Consumer<ProfileController>(
          builder: (context, support, child) {
            return Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    kHeight15,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            support.isPostRequest == true
                                ? null
                                : support.isPostRequestEnabled();
                          },
                          child: Text(
                            'Post Request',
                            style: FontStyles().randomTextStylePoppins(
                              size: support.isPostRequest == true ? 17 : 15,
                              weight: FontWeight.w600,
                              color: support.isPostRequest == true
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
                            child: Divider(
                              color: color.kLightGrey,
                              thickness: 1.5,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            support.isPostRequest != true
                                ? null
                                : support.isPostRequestEnabled();
                          },
                          child: Text(
                            'My Request',
                            style: FontStyles().randomTextStylePoppins(
                              size: support.isPostRequest != true ? 17 : 15,
                              weight: FontWeight.w600,
                              color: support.isPostRequest != true
                                  ? color.primaryDarkColor
                                  : color.kGrey,
                            ),
                          ),
                        ),
                      ],
                    ),

                    support.isPostRequest
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              kHeight30,
                              Center(
                                child: Text(
                                  'Get In Touch',
                                  style: FontStyles().randomTextStylePoppins(
                                    size: 23,
                                    weight: FontWeight.w600,
                                    color: color.primaryDarkColor,
                                  ),
                                ),
                              ),
                              Center(
                                child: Text(
                                  'If you have any inquiries get in touch with us.\nWe will be happy to help you.',
                                  textAlign: TextAlign.center,
                                  style: FontStyles().randomTextStylePoppins(
                                    size: 14,
                                    weight: FontWeight.w500,
                                    color: color.kGrey,
                                  ),
                                ),
                              ),

                              kHeight30,

                              _requestField(context, 'Title', 23),
                              kHeight20,
                              _requestField(context, 'Message', 23),
                              kHeight20,
                              DottedBorder(
                                options: RectDottedBorderOptions(
                                  dashPattern: [2, 4],
                                  strokeWidth: 1.5,
                                ),
                                child: Container(
                                  height: 50,
                                  width: double.infinity,
                                  color: Colors.white,
                                  child: Center(
                                    child: Text(
                                      'Upload File',
                                      style: FontStyles()
                                          .randomTextStylePoppins(
                                            size: 16,
                                            weight: FontWeight.w400,
                                            color: color.kGrey,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              kHeight15,
                              Container(
                                height: 60,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: color.primaryColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    'Submit Report',
                                    style: FontStyles().randomTextStylePoppins(
                                      size: 16,
                                      weight: FontWeight.w600,
                                      color: color.kBlack,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              kHeight40,
                              ListView.separated(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Center(
                                    child: Text(
                                      'No Request Found',
                                      style: FontStyles()
                                          .randomTextStylePoppins(
                                            size: 16,
                                            weight: FontWeight.w500,
                                            color: color.kBlackSecondary,
                                          ),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) => kHeight10,
                                itemCount: 1,
                              ),
                            ],
                          ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  TextFormField _requestField(
    BuildContext context,
    String hintText,
    double height,
  ) {
    return TextFormField(
      maxLines: null,
      textInputAction: TextInputAction.done,
      onTapOutside: (_) {
        FocusScope.of(context).unfocus();
      },
      decoration: InputDecoration(
        labelText: hintText,
        labelStyle: FontStyles().randomTextStylePoppins(
          size: 16,
          weight: FontWeight.w400,
          color: color.kGrey,
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(19),
          borderSide: BorderSide(color: color.kLightGrey, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(19),
          borderSide: BorderSide(color: color.kLightGrey, width: 1),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(19),
          borderSide: BorderSide(color: color.kLightGrey, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(19),
          borderSide: BorderSide(color: color.kLightGrey, width: 1),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: height),
      ),
    );
  }
}
