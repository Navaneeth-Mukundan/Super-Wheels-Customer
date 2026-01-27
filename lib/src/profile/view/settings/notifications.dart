import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_wheels_customer_app/src/onboarding/view/splash_screen.dart';
import 'package:super_wheels_customer_app/src/profile/controller/profile_controller.dart';
import 'package:super_wheels_customer_app/src/utils/constants/asset_store.dart';
import 'package:super_wheels_customer_app/src/utils/constants/screen_route.dart';
import 'package:super_wheels_customer_app/src/utils/constants/space_helper.dart';
import 'package:super_wheels_customer_app/src/utils/themes/styles/font_style.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

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
          toolbarHeight: 80,
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
            'Notifications',
            style: FontStyles().randomTextStylePoppins(
              size: 18,
              letterSpacing: 0.5,
              color: color.kBlackSecondary,
              weight: FontWeight.w600,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsetsGeometry.only(left: 15, right: 15),
          child: Consumer<ProfileController>(
            builder: (context, notify, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildNotificationToggle(
                    title: 'Enable All Notifications',
                    value: notify.enableNotification,
                    onChanged: (value) {
                      notify.enableNotificationButton();
                    },
                  ),
                  kHeight10,
                  _buildNotificationToggle(
                    title: 'Enable Instant Ride Notifications',
                    value: notify.enableInstantNotification,
                    onChanged: (value) {
                      notify.enableInstantNotificationButton();
                    },
                  ),
                  kHeight40,
                  Text(
                    "Notification Types:",
                    style: FontStyles().randomTextStylePoppins(
                      size: 18,
                      weight: FontWeight.w600,
                      color: color.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 15),

                  _buildNotificationTypeItem(
                    icon: Icons.person,
                    title: "Driver Assigned",
                    subtitle: "Notify when a driver accepts your ride",
                    isActive:
                        notify.enableNotification &&
                        notify.enableInstantNotification,
                  ),
                  _buildNotificationTypeItem(
                    icon: Icons.cancel,
                    title: "Ride Rejected",
                    subtitle: "Notify when a driver rejects your ride",
                    isActive:
                        notify.enableNotification &&
                        notify.enableInstantNotification,
                  ),
                  _buildNotificationTypeItem(
                    icon: Icons.directions_car,
                    title: "Ride Started",
                    subtitle: "Notify when your ride begins",
                    isActive: notify.enableNotification,
                  ),
                  _buildNotificationTypeItem(
                    icon: Icons.flag,
                    title: "Ride Completed",
                    subtitle: "Notify when your ride ends",
                    isActive: notify.enableNotification,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationToggle({
    required String title,
    required bool value,
    required ValueChanged<bool>? onChanged,
    bool isEnabled = true,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: isEnabled ? const Color(0xFFD4AF37) : Colors.grey,
            ),
          ),
          Transform.scale(
            scale: 0.7,
            child: Switch(
              value: value,
              onChanged: onChanged,
              activeThumbColor: const Color(0xFFD4AF37),
              inactiveTrackColor: const Color.fromARGB(255, 225, 225, 225),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationTypeItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool isActive,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: ListTile(
        leading: Icon(icon, color: isActive ? color.primaryColor : color.kGrey),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isActive ? color.kBlack : color.kGrey,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            color: isActive ? color.kBlackSecondary : color.kGrey,
          ),
        ),
        trailing: Icon(
          isActive ? Icons.notifications_active : Icons.notifications_off,
          color: isActive ? const Color(0xFFD4AF37) : color.kGrey,
        ),
      ),
    );
  }
}
