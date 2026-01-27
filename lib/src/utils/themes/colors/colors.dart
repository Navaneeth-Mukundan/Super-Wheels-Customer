import 'package:flutter/material.dart';
import 'package:super_wheels_customer_app/src/utils/constants/screen_route.dart';

class ColorManager {
  Color primaryColor = const Color(0XFFd4b037);
  Color primaryDarkColor = const Color.fromARGB(255, 200, 158, 22);
  Color secondaryColor = const Color.fromARGB(255, 247, 204, 66);
  Color kWhite = Colors.white;
  Color kWhiteSecondary = const Color(0XFFF1F1F1);
  Color kBlack = const Color(0xff1E1E1E);
  Color kBlackSecondary = const Color(0XFF555555);
  Color kGrey = const Color(0xFF606060);
  Color kLightGrey = androidPlatform
      ? const Color.fromARGB(255, 196, 196, 196)
      : const Color(0XFFBDBDBD);
  Color kTransparent = Colors.transparent;
}
