import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_wheels_customer_app/src/auth/controller/auth_controller.dart';
import 'package:super_wheels_customer_app/src/home/view/home.dart';
import 'package:super_wheels_customer_app/src/myRide/view/my_ride.dart';
import 'package:super_wheels_customer_app/src/onboarding/view/splash_screen.dart';
import 'package:super_wheels_customer_app/src/profile/view/profile.dart';
import 'package:super_wheels_customer_app/src/utils/themes/colors/colors.dart';

class BottomNavigation extends StatelessWidget {
  final List<Widget> _screens = [
    const HomeScreen(),
    const MyRideScreen(),
    const ProfileScreen(),
  ];

  final List<IconData> images = [
    Icons.home_outlined,
    Icons.drive_eta_outlined,
    Icons.person_outline,
  ];

  BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthController>(
      builder: (context, controller, child) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          extendBody: true,
          body: Stack(
            children: [
              _screens[controller.selectedIndex],
              Positioned(
                left: 0,
                right: 0,
                bottom: 20,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 0),
                            color: color.kBlackSecondary,
                            blurRadius: 1,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(images.length, (index) {
                          final isSelected = controller.selectedIndex == index;
                          return GestureDetector(
                            onTap: () => controller.updateIndex(index),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: isSelected
                                  ? BoxDecoration(
                                      color: ColorManager().secondaryColor,
                                      shape: BoxShape.circle,
                                    )
                                  : null,
                              child: Icon(images[index]),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
