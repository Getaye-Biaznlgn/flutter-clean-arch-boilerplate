import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';

void backgroundNotificationHandler(NotificationResponse response) {
  NotificationApi.onNotifications.add(response.payload);
}

class NotificationApi {
  static final _notifications = FlutterLocalNotificationsPlugin();
  static final onNotifications = BehaviorSubject<String?>();

  static Future showNotification(
          {int id = 0, String? title, String? body, String? payload}) async =>
      _notifications.show(
        id,
        title,
        body,
        await _notificationDetails(),
        payload: payload,
      );

  static Future _notificationDetails() async {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'channelId',
        'channelName',
        importance: Importance.max,
        priority: Priority.high,
        color: Colors.transparent,
      ),
      iOS: DarwinNotificationDetails(sound: 'default'),
    );
  }

  static Future init() async {
    const android = AndroidInitializationSettings('ic_launcher');
    const iOS = DarwinInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
    );
    const settings = InitializationSettings(android: android, iOS: iOS);

    await _notifications.initialize(settings,
        onDidReceiveNotificationResponse: (NotificationResponse response) {
      onNotifications.add(response.payload);
    },
        onDidReceiveBackgroundNotificationResponse:
            backgroundNotificationHandler);

// To give channel id for default fcm notifications too
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'channelId',
      'channelName',
      importance: Importance.max,
    );
    await _notifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  static void onClickedNotification(String? payload) {
     // Todo: implment where to navigate
   
  }

  static closeNotificationListener() {
    onNotifications.close();
  }
}
