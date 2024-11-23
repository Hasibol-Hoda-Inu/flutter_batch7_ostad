import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotification{
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static Future<void> onDidReceiveNotification(NotificationResponse notificationResponse)async{}
  static Future<void> init()async{
    const AndroidInitializationSettings androidInitializationSettings = AndroidInitializationSettings("@mipmap/ic_launcher.png");
    const DarwinInitializationSettings darwinInitializationSettings = DarwinInitializationSettings();
    const InitializationSettings initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: darwinInitializationSettings,
    );
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveBackgroundNotificationResponse:onDidReceiveNotification,
      onDidReceiveNotificationResponse:onDidReceiveNotification,
    );
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
  }
  static Future<void>showInstanceNotification(String title, String body)async {
    const NotificationDetails()
  }
}