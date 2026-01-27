import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_wheels_customer_app/src/onboarding/view/splash_screen.dart';
import 'package:super_wheels_customer_app/src/profile/controller/profile_controller.dart';
import 'package:super_wheels_customer_app/src/utils/constants/asset_store.dart';
import 'package:super_wheels_customer_app/src/utils/constants/screen_route.dart';
import 'package:super_wheels_customer_app/src/utils/constants/space_helper.dart';
import 'package:super_wheels_customer_app/src/utils/themes/styles/font_style.dart';

class DeleteAccountScreen extends StatelessWidget {
  final List<String> _reasons = [
    "I find Super Wheels is too expensive",
    "I'm moving to a region where Super Wheels does not operate",
    "I use another Super Wheels account",
    "Other",
  ];

  DeleteAccountScreen({super.key});

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
            'Delete Account',
            style: FontStyles().randomTextStylePoppins(
              size: 17,
              letterSpacing: 0.5,
              color: color.kBlackSecondary,
              weight: FontWeight.w600,
            ),
          ),
        ),
        body: Consumer<ProfileController>(
          builder: (context, account, child) {
            return Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    account.isDeleteContinue == false
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Image.asset(
                                  AssetStore().logo,
                                  height: 70,
                                ),
                              ),
                              kHeight10,
                              Center(
                                child: Image.asset(
                                  AssetStore().logoText,
                                  height: 70,
                                ),
                              ),
                              kHeight25,
                              _headingText('Deleting your account'),
                              kHeight15,
                              _contentText(
                                "We'd hate to see you go, but if you're decided then here are a few things you need to know.",
                              ),
                              kHeight10,
                              _contentText(
                                "Once your account is deleted, you can't reactivate it, recover any data, or regain access. You'll need to set up a new account if you want to use Super Wheels again.",
                              ),
                              kHeight20,
                              _headingText(
                                'When you submit a request to delete your account:',
                              ),
                              kHeight10,
                              _contentText(
                                "→ We'll verify your identity for security purposes before accepting the request.",
                              ),
                              kHeight15,
                              _contentText(
                                "→  Once your request is processed, your personal information will be deleted except for certain information that we're legally required to retain.",
                              ),
                              kHeight20,
                              _headingText(
                                'Before requesting to delete your account',
                              ),
                              kHeight15,

                              _contentText("Please check the following:"),
                              kHeight10,
                              _contentText(
                                "→ You need to complete any ongoing rides or bookings",
                              ),
                              kHeight10,
                              _contentText(
                                "→ You need to cancel any scheduled rides or bookings",
                              ),
                              kHeight10,
                              _contentText(
                                "→ Your Super Wheels Pay wallet credit/balance will need to be zero",
                              ),
                              kHeight20,
                              _headingText('Important Information'),
                              kHeight15,
                              _contentText(
                                "Once you submit your request, you will be automatically logged out.",
                              ),
                              kHeight20,
                              GestureDetector(
                                onTap: () {
                                  account.continueAccountDeletion();
                                },
                                child: Container(
                                  height: 60,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: color.primaryColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Continue',
                                      style: FontStyles()
                                          .randomTextStylePoppins(
                                            size: 16,
                                            letterSpacing: 1,
                                            weight: FontWeight.w600,
                                            color: color.kBlackSecondary,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Image.asset(
                                  AssetStore().logo,
                                  height: 70,
                                ),
                              ),
                              kHeight10,
                              Center(
                                child: Image.asset(
                                  AssetStore().logoText,
                                  height: 70,
                                ),
                              ),
                              kHeight25,
                              _headingText('Help us understand why'),
                              kHeight15,
                              _contentText(
                                "Your feedback is important to us and it will help us improve the experience in the future.",
                              ),
                              kHeight20,
                              _cancelReason(),

                              _headingText('Any other suggestions or feedback'),
                              kHeight10,
                              TextFormField(
                                maxLines: null,
                                textInputAction: TextInputAction.done,
                                onTapOutside: (_) {
                                  FocusScope.of(context).unfocus();
                                },
                                decoration: InputDecoration(
                                  fillColor: color.kWhite,
                                  filled: true,
                                  hintText: 'Any other suggestions or feedback',
                                  hintStyle: FontStyles()
                                      .randomTextStylePoppins(
                                        size: 16,
                                        weight: FontWeight.w400,
                                        color: color.kGrey,
                                      ),

                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(19),
                                    borderSide: BorderSide(
                                      color: color.kLightGrey,
                                      width: 1,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(19),
                                    borderSide: BorderSide(
                                      color: color.kLightGrey,
                                      width: 1,
                                    ),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(19),
                                    borderSide: BorderSide(
                                      color: color.kLightGrey,
                                      width: 1,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(19),
                                    borderSide: BorderSide(
                                      color: color.kLightGrey,
                                      width: 1,
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 23,
                                  ),
                                ),
                              ),
                              kHeight15,
                              GestureDetector(
                                onTap: () {
                                  account.continueAccountDeletion();
                                },
                                child: Container(
                                  height: 60,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: color.kWhite),
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Delete Profile',
                                      style: FontStyles()
                                          .randomTextStylePoppins(
                                            size: 16,
                                            letterSpacing: 1,
                                            weight: FontWeight.w700,
                                            color: color.kWhite,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                    kHeight50,
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  _cancelReason() {
    return ListView.separated(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Checkbox(
              activeColor: color.kWhite,
              checkColor: color.primaryColor,
              side: BorderSide(color: color.kBlack),

              value: false,
              onChanged: (val) {
                val = !val!;
              },
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                _reasons[index],
                style: FontStyles().randomTextStylePoppins(
                  size: 15,
                  color: color.kBlack,
                  weight: FontWeight.w500,
                ),
              ),
            ),
          ],
        );
      },
      separatorBuilder: (context, index) => kHeight5,
      itemCount: 4,
    );
  }

  Text _contentText(String content) {
    return Text(
      content,
      style: FontStyles().randomTextStylePoppins(
        size: 15,
        color: color.kBlack,
        weight: FontWeight.w500,
      ),
    );
  }

  _headingText(String heading) {
    return IntrinsicWidth(
      child: IntrinsicHeight(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                'https://www.pngall.com/wp-content/uploads/13/Ripped-Paper-PNG.png',
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: Text(
            heading,
            style: FontStyles().randomTextStylePoppins(
              size: 20,
              color: color.primaryDarkColor,
              weight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
