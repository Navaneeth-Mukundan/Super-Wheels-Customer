import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:timezone/data/latest.dart' as tz;

final storage = FlutterSecureStorage(
  aOptions: AndroidOptions(encryptedSharedPreferences: true),
);

class NotificationController extends ChangeNotifier {
  static final FirebaseMessaging _firebaseMessaging =
      FirebaseMessaging.instance;
  static final FlutterLocalNotificationsPlugin
  _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  final StreamController<String> _notificationStreamController =
      StreamController<String>.broadcast();

  Stream<String> get onNotificationTap => _notificationStreamController.stream;
  Future<void> initialize() async {
    // Initialize timezone database
    tz.initializeTimeZones();

    // Request permission
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      debugPrint('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      debugPrint('User granted provisional permission');
    } else {
      debugPrint('User declined or has not accepted permission');
    }
    // Initialize local notifications
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
          requestAlertPermission: true,
          requestBadgePermission: true,
          requestSoundPermission: true,
        );
    final InitializationSettings initializationSettings =
        InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: initializationSettingsDarwin,
        );

    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        if (response.payload != null) {
          _notificationStreamController.add(response.payload!);
        }
      },
    );
    final notificationStatus = await storage.read(
      key: 'enableRideNotifications',
    );
    // Handle foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (notificationStatus == 'true') {
        _showNotification(message);
      }
    });

    // Handle when app is in background but not terminated
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (message.data['tripId'] != null) {
        _notificationStreamController.add(message.data['tripId']);
      }
    });
  }

  static Future<void> firebaseBackgroundHandler(RemoteMessage message) async {
    final notificationStatus = await storage.read(
      key: 'enableRideNotifications',
    );
    if (notificationStatus == 'true') {
      await showLocalNotification(
        message.notification?.title ?? 'Notification',
        message.notification?.body ?? '',
        message.data['tripId'] ?? '',
      );
    }
  }

  static Future<void> showLocalNotification(
    String title,
    String body,
    String payload,
  ) async {
    debugPrint(
      "Showing notification - Title: $title, Body: $body, Payload: $payload",
    );

    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
          'ride_updates_channel',
          'Ride Updates',
          importance: Importance.max,
          priority: Priority.high,
          showWhen: false,
          enableVibration: true,
          playSound: true,
        );

    await _flutterLocalNotificationsPlugin.show(
      title.hashCode,
      title,
      body,
      NotificationDetails(android: androidPlatformChannelSpecifics),
      payload: payload,
    );
  }

  static Future<void> _showNotification(RemoteMessage message) async {
    final data = message.data;
    String payload = '';

    if (data.containsKey('tripId')) {
      payload = 'tripId:${data['tripId']}';
      if (data.containsKey('status')) {
        payload += ':status:${data['status']}';
      }
    }

    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
          'ride_updates_channel',
          'Ride Updates',
          importance: Importance.max,
          priority: Priority.high,
          showWhen: false,
          enableVibration: true,
          playSound: true,
        );

    await _flutterLocalNotificationsPlugin.show(
      message.hashCode,
      message.notification?.title ?? 'Ride Update',
      message.notification?.body ?? '',
      NotificationDetails(android: androidPlatformChannelSpecifics),
      payload: payload,
    );
  }
}
