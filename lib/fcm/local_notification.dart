import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

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
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: AndroidNotificationDetails(
        "channel_Id",
        "channel_Name",
        importance: Importance.high,
        priority: Priority.high
      ),
      iOS: DarwinNotificationDetails(),
    );
    await flutterLocalNotificationsPlugin.show(0, title, body, platformChannelSpecifics);
  }
  static Future<void>scheduledNotification(String title, String body, DateTime scheduledDate)async {
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: AndroidNotificationDetails(
          "channel_Id",
          "channel_Name",
          importance: Importance.high,
          priority: Priority.high
      ),
      iOS: DarwinNotificationDetails(),
    );
    await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        title,
        body,
        tz.TZDateTime.from(scheduledDate, tz.local),
        platformChannelSpecifics,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
        androidScheduleMode: AndroidScheduleMode.exact,
      matchDateTimeComponents: DateTimeComponents.dateAndTime
    );
  }
}