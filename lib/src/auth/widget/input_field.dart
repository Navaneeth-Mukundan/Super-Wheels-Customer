import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_wheels_customer_app/src/auth/controller/auth_controller.dart';
import 'package:super_wheels_customer_app/src/onboarding/view/splash_screen.dart';
import 'package:super_wheels_customer_app/src/utils/themes/styles/font_style.dart';

class InputFieldWidget extends StatelessWidget {
  final String hintText;
  const InputFieldWidget({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthController>(
      builder: (context, auth, child) {
        return TextFormField(
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.done,
          onTapOutside: (_) {
            FocusScope.of(context).unfocus();
          },
          decoration: InputDecoration(
            prefixText: "🇦🇪 +971 ",

            prefixStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 23,
            ),
          ),
        );
      },
    );
  }
}
