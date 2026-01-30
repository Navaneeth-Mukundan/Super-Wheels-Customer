import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:super_wheels_customer_app/firebase_options.dart';
import 'package:super_wheels_customer_app/src/app.dart';
import 'package:super_wheels_customer_app/src/notification/controller/notification_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  await NotificationController().initialize();
  FirebaseMessaging.onBackgroundMessage(
    NotificationController.firebaseBackgroundHandler,
  );

  runApp(const MyApp());
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await NotificationController.firebaseBackgroundHandler(message);
}
