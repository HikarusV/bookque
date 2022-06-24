import 'dart:ffi';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/subjects.dart';

class NotificationSystem {
  static final selectNotificationSubject = BehaviorSubject<String>();

  static late FlutterLocalNotificationsPlugin _notifications;

  static late AndroidNotificationChannel channel;

  static const initAndroidSetting =
      AndroidInitializationSettings('@mipmap/ic_logo_trp_f');

  static const initSetting = InitializationSettings(
    android: initAndroidSetting,
  );

  static Future init({
    required FlutterLocalNotificationsPlugin initNotifPlugin,
    required AndroidNotificationChannel androidChannel,
  }) async {
    _notifications = initNotifPlugin;
    channel = androidChannel;

    await _notifications.initialize(
      initSetting,
      onSelectNotification: (payload) async {
        selectNotificationSubject.add(payload!);
        print(payload);
      },
    );

    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        RemoteNotification? remoteNotification = message.notification;
        AndroidNotification? androidNotification =
            message.notification?.android;

        if (remoteNotification != null && androidNotification != null) {
          final data = remoteNotification;
          showNotif(
            data.title!,
            data.body!,
            'payload firebase',
            id: data.hashCode,
          );
        }
      },
    );

    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      print('ada pesan dari firebase : ${event.notification?.title ?? 'none'}');
    });
  }

  static void showNotif(
    String title,
    String body,
    String payload, {
    int id = 0,
  }) async {
    await _notifications.show(
      id,
      title,
      body,
      NotificationDetails(
        android: AndroidNotificationDetails(channel.id, channel.name,
            channelDescription: channel.description,
            priority: Priority.max,
            ticker: 'ticker',
            color: Colors.blue),
      ),
      payload: payload,
    );
  }

  // static Future<bool> getAppLaunchFromNotifDetails() async {
  //   final details = await _notifications.getNotificationAppLaunchDetails();
  //   if (details != null && details.didNotificationLaunchApp) {
  //     return true;
  //   }
  //   return false;
  // }
  //
  // static Future<String> getNotificationsPayload() async {
  //   final details = await _notifications.getNotificationAppLaunchDetails();
  //   return (details?.payload) ?? 'none';
  // }
}
